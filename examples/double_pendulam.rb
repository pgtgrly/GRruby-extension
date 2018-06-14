require '../lib/grruby.rb'

$g = 9.8        # Gravitational constant
$l1 = 1.2       # length of rods
$l2 = 1.0
$m1 = 1.0       # weights of bobs
$m2 = 1.5
$t1 = 100.0     # inintial angles
$t2 = -20.0
$w1 = 0.0
$w2 = 0.0
$t = 0
$dt = 0.04


def pendulum_derivs(t, state)
  # The following derivation is from:
  # http://scienceworld.wolfram.com/physics/DoublePendulum.html
  t1, w1, t2, w2 = state
  a = ($m1 + $m2) * $l1
  b = $m2 * $l2 * Math.cos(t1 - t2)
  c = $m2 * $l1 * Math.cos(t1 - t2)
  d = $m2 * $l2
  e = -$m2 * $l2 * $w2**2 * Math.sin(t1 - t2) - $g * ($m1 + $m2) * Math.sin(t1)
  f =  $m2 * $l1 * $w1**2 * Math.sin(t1 - t2) - $m2 * $g * Math.sin(t2)
  return [w1, (e*d-b*f) / (a*d-c*b), w2, (a*f-c*e) / (a*d-c*b)]
end

def rk4(x, h, y)
  k1 = pendulum_derivs(x, y).collect { |n| n * h }
  k2 =  pendulum_derivs(x + 0.5 * h, y + 0.5 * k1).collect { |n| n * h }
  k3 =  pendulum_derivs(x + 0.5 * h, y + 0.5 * k2).collect { |n| n * h }
  k4 =  pendulum_derivs(x + h, y + k3).collect { |n| n * h }
  return x + h, y + (k1 + 2 * (k2 + k3) + k4) / 6.0
end

def pendulum(theta, length, mass)
  l = length[0] + length[1]
  GR.clearws()
  GR.setviewport(0, 1, 0, 1)
  GR.setwindow(-l, l, -l, l)
  GR.setmarkertype(-1)
  GR.setmarkercolorind(86)
  pivot = [0, 0.775]                         # draw pivot point
  GR.fillarea([-0.2, 0.2, 0.2, -0.2], [0.75, 0.75, 0.8, 0.8])
  for i in 0..2
    x = [pivot[0], pivot[0] + Math.sin(theta[i]) * length[i]]
    y = [pivot[1], pivot[1] - Math.cos(theta[i]) * length[i]]
    GR.polyline(x, y)                   # draw rod
    GR.setmarkersize(3 * mass[i])
    GR.polymarker([x[1]], [y[1]])       # draw bob
    pivot = [x[1], y[1]]
  end
  GR.updatews()
end

state = [$t1, $w1, $t2, $w2].collect { |n| n * Math::PI / 180 }

now = Time.now.to_f

while $t < 30
  start = now

  $t, state = rk4($t, $dt, state)
  $t1, $w1, $t2, $w2 = state
  pendulum([$t1, $t2], [$l1, $l2], [$m1, $m2])

  now = Time.now.to_f
  if start + $dt > now
      sleep(start + $dt - now)
  end
end