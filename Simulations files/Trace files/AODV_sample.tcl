set ns [new Simulator]
# Create a nam trace datafile.
set namfile [open AODV_final.nam w]

set Time [open time.tr w]

#This Block Is For Congestion Window Trace file. Here 5 sample trace file
set cwnd1 [open cwnd1.tr w]
set cwnd2 [open cwnd2.tr w]
set cwnd3 [open cwnd3.tr w]
set cwnd4 [open cwnd4.tr w]
set cwnd5 [open cwnd5.tr w]
#This Block Is For Bandwidth Calculation Trace file. Here 5 sample trace file
set b1 [open b1.tr w]
set b2 [open b2.tr w]
set b3 [open b3.tr w]
set b4 [open b4.tr w]
set b5 [open b5.tr w]


$ns namtrace-all $namfile
# ----- Setup wireless environment. ----
set wireless_tracefile [open AODV_final.trace w]
set topography [new Topography]
$ns trace-all $wireless_tracefile
$ns namtrace-all-wireless $namfile 3000  1600 
$topography load_flatgrid 3000  1600

#TN means Total number of  wireless node
global TN
set TN 50
set god_ [create-god $TN]
#global node setting
$ns node-config -adhocRouting AODV \
	             -llType LL \
		     -macType Mac/802_11\
		     -ifqLen 50 \
		     -ifqType Queue/DropTail/PriQueue \
		     -antType Antenna/OmniAntenna \
		     -propType Propagation/TwoRayGround \
		     -phyType Phy/WirelessPhy \
		     -channel [new Channel/WirelessChannel] \
		     -topoInstance $topography \
		     -agentTrace ON \
		     -routerTrace ON \
		     -macTrace ON \
                     -movementTrace ON

# Create wireless nodes.
#I have used few loop and to set in  diffrent position i have use few defined value

#Here X and Y is the axix
set x1 160
set y1 150
set x2 350
set y2 200
set x3 550
set y3 150
set x4 755
set y4 200
set x5 960
set y5 150
set x6 1150
set y6 200
set x7 1350
set y7 150
set x8 1550
set y8 200
set x9 1750
set y9 150
set x10 1970
set y10 200
set x11 2150
set y11 230
set x12 2240
set y12 200
set x13 2390
set y13 250
set x14 2500
set y14 210
set x15 2670
set y15 180

#Setting node position block
        for {set i 0} {$i < $TN} {incr i} {
            set node($i) [$ns node]
            $node($i) random-motion 0
            $ns at 0.0 "$node($i) label Node_($i)"
            $ns initial_node_pos $node($i) 50.000000
        }
        for {set j 0} {$j < $TN} {incr j} {
            
            set Tcp($j) [new Agent/TCP]
            $ns attach-agent $node($j) $Tcp($j)
            $ns color 1 "black"
            $Tcp($j) set fid_ $j
            $Tcp($j) set packetSize_ 512
            $Tcp($j) set window_ 20
            $Tcp($j) set windowInit_ 1
            $Tcp($j) set maxcwnd_ 0
            #Set TCPSink
            set TcpSink($j) [new Agent/TCPSink]
            $ns attach-agent $node($j) $TcpSink($j)
            $TcpSink($j) set packetSize_ 210
            #Set Trafic Source
            
            set Ftp($j) [new Application/FTP]
            $Ftp($j) attach-agent $Tcp($j)
            $Ftp($j) set maxpkts_ 2048
        }
        
        
	for {set j1 0} {$j1 < $TN} {incr j1 15} {
	incr x1 0
	incr y1 150
	$node($j1) set X_ $x1
	$node($j1) set Y_ $y1
        $node($j1) set Z_ 0
	$node($j1) color "green"
        $ns at 0.000000 "$node($j1) setdest $x1 $y1 0.00"
        
	}

	for {set j2 1} {$j2 < $TN} {incr j2 15} {
	incr x2 0
	incr y2 140
	$node($j2) set X_ $x2
	$node($j2) set Y_ $y2
        $node($j2) set Z_ 0
	$node($j2) color "blue"
        $ns at 0.000000 "$node($j2) setdest $x2 $y2 0.00"
	}

	
	for {set j3 2} {$j3 < $TN} {incr j3 15} {
	incr x3 0
	incr y3 140
	$node($j3) set X_ $x3
	$node($j3) set Y_ $y3
        $node($j3) set Z_ 0
	$node($j3) color "red"
        $ns at 0.000000 "$node($j3) setdest $x3 $y3 0.00"
	}

	for {set j4 3} {$j4 < $TN} {incr j4 15} {
	incr x4 0
	incr y4 160
	$node($j4) set X_ $x4
	$node($j4) set Y_ $y4
        $node($j4) set Z_ 0
	$node($j4) color "blue"
        $ns at 0.000000 "$node($j4) setdest $x4 $y4 0.00"
	}

	

	for {set j5 4} {$j5 < $TN} {incr j5 15} {
	incr x5 0
	incr y5 170
	$node($j5) set X_ $x5
	$node($j5) set Y_ $y5
        $node($j5) set Z_ 0
	$node($j5) color "black"
        $ns at 0.000000 "$node($j5) setdest $x5 $y5 0.00"
	}

	for {set j6 5} {$j6 < $TN} {incr j6 15} {
	incr x6 0
	incr y6 120
	$node($j6) set X_ $x6
	$node($j6) set Y_ $y6
        $node($j6) set Z_ 0
	$node($j6) color "green"
        $ns at 0.000000 "$node($j6) setdest $x6 $y6 0.00"
	}

	for {set j7 6} {$j7 < $TN} {incr j7 15} {
	incr x7 0
	incr y7 160
	$node($j7) set X_ $x7
	$node($j7) set Y_ $y7
        $node($j7) set Z_ 0
	$node($j7) color "blue"
        $ns at 0.000000 "$node($j7) setdest $x7 $y7 0.00"
	}

	for {set j8 7} {$j8 < $TN} {incr j8 15} {
	incr x8 0
	incr y8 180
	$node($j8) set X_ $x8
	$node($j8) set Y_ $y8
        $node($j8) set Z_ 0
	$node($j8) color "red"
        $ns at 0.000000 "$node($j8) setdest $x8 $y8 0.00"
	}


	for {set j9 8} {$j9 < $TN} {incr j9 15} {
	incr x9 0
	incr y9 140
	$node($j9) set X_ $x9
	$node($j9) set Y_ $y9
        $node($j9) set Z_ 0
	$node($j9) color "black"
        $ns at 0.000000 "$node($j9) setdest $x9 $y9 0.00"
	}

	for {set j10 9} {$j10 < $TN} {incr j10 15} {
	incr x10 0
	incr y10 140
	$node($j10) set X_ $x10
	$node($j10) set Y_ $y10
        $node($j10) set Z_ 0
	$node($j10) color "green"
        $ns at 0.000000 "$node($j10) setdest $x10 $y10 0.00"
	}
	for {set j11 10} {$j11 < $TN} {incr j11 15} {
	incr x11 0
	incr y11 140
	$node($j11) set X_ $x11
	$node($j11) set Y_ $y11
        $node($j11) set Z_ 0
	$node($j11) color "blue"
        $ns at 0.000000 "$node($j11) setdest $x11 $y11 0.00"
	}

	for {set j12 11} {$j12 < $TN} {incr j12 15} {
	incr x12 0
	incr y12 140
	$node($j12) set X_ $x12
	$node($j12) set Y_ $y12
        $node($j12) set Z_ 0
	$node($j12) color "red"
        $ns at 0.000000 "$node($j12) setdest $x12 $y12 0.00"
	}

	for {set j13 12} {$j13 < $TN} {incr j13 15} {
	incr x13 0
	incr y13 140
	$node($j13) set X_ $x13
	$node($j13) set Y_ $y13
        $node($j13) set Z_ 0
	$node($j13) color "green"
        $ns at 0.000000 "$node($j13) setdest $x13 $y13 0.00"
	}
        for {set j14 13} {$j14 < $TN} {incr j14 15} {
	incr x14 0
	incr y14 140
	$node($j14) set X_ $x14
	$node($j14) set Y_ $y14
        $node($j14) set Z_ 0
	$node($j14) color "black"
        $ns at 0.000000 "$node($j14) setdest $x14 $y14 0.00"
	}
        for {set j15 14} {$j15 < $TN} {incr j15 15} {
	incr x15 0
	incr y15 140
	$node($j15) set X_ $x15
	$node($j15) set Y_ $y15
        $node($j15) set Z_ 0
	$node($j15) color "green"
        $ns at 0.000000 "$node($j15) setdest $x15 $y15 0.00"
	}

#Animate Few of node
$ns at 10.000000 "$node(0) setdest 160 450 75"
$ns at 10.000000 "$node(1) setdest 343.017365 158.321411 12.667036"
$ns at 10.000000 "$node(2) setdest 943.017365 58.321411 16.667036"
$ns at 4.000000 "$node(3) setdest 2755 360 20"
$ns at 10.000000 "$node(4) setdest 960 1320 10"
$ns at 10.000000 "$node(5) setdest 343.017365 258.321411 11.667036"

$ns at 10.000000 "$node(6) setdest 2700.00 1500.00 64.935"
$ns at 10.000000 "$node(7) setdest 100 800 83.9130 "
$ns at 10.000000 "$node(8) setdest 500 1200 66.612 "

$ns at 10.000000 "$node(15) setdest 2700 1200 12.9682 "
$ns at 10.000000 "$node(25) setdest 150 1400 36.484 "
$ns at 10.000000 "$node(28) setdest 170 180 23.5053"
# Connect agents.

# Connect agents.
 

#Connect Source to destination
$ns connect $Tcp(0) $TcpSink(15)
$ns connect $Tcp(1) $TcpSink(25)
$ns connect $Tcp(16) $TcpSink(41)
$ns connect $Tcp(31) $TcpSink(42)
$ns connect $Tcp(46) $TcpSink(7)


# Traffic Source actions.
$ns at 0.020000 "$Ftp(0) start"
$ns at 0.020000 "$Ftp(1) start"
$ns at 0.020000 "$Ftp(16) start"
$ns at 0.020000 "$Ftp(31) start"
$ns at 0.020000 "$Ftp(46) start"

$ns at 590.000000 "$Ftp(0) stop"
$ns at 590.000000 "$Ftp(1) stop"
$ns at 590.000000 "$Ftp(16) stop"
$ns at 590.000000 "$Ftp(31) stop"
$ns at 590.000000 "$Ftp(46) stop"

#Custom Proc To get time
    proc getTime {file} {
        global ns  
        set time 0.2
        set now [$ns now]
        puts $file "$now"
        #Re Call
        $ns at [expr $now + $time] " getTime $file"
    }
    
    $ns at 0.0 "getTime $Time"

#Custom Proc To calculate congestion window
    proc calcCwnd {tcpSource file} {
        global ns  
        set time 0.2
        set now [$ns now]
        set cwnd [$tcpSource set cwnd_] 
        puts $file "$cwnd"
        #Re Call
        $ns at [expr $now + $time] " calcCwnd $tcpSource $file"
    }
     $ns at 0.0 "calcCwnd $Tcp(0) $cwnd1"
     $ns at 0.0 "calcCwnd $Tcp(1) $cwnd2"
     $ns at 0.0 "calcCwnd $Tcp(16) $cwnd3"
     $ns at 0.0 "calcCwnd $Tcp(31) $cwnd4"
     $ns at 0.0 "calcCwnd $Tcp(46) $cwnd5"
#Custom Proc To calculate Bandwidth
    proc calcByte {sink file} {
        global ns 
        set time 0.2
        set bw0 [$sink set bytes_]
        set now [$ns now]
        puts $file " [expr {$bw0 / $time * 8 / 1000000}] "
        #Reset
        $sink set bytes_ 0
        #Re Call
        $ns at [expr $now + $time] "calcByte $sink  $file "
     }
    $ns at 0.0 "calcByte $TcpSink(15) $b1"
    $ns at 0.0 "calcByte $TcpSink(25) $b2"
    $ns at 0.0 "calcByte $TcpSink(41) $b3"
    $ns at 0.0 "calcByte $TcpSink(42) $b4"
    $ns at 0.0 "calcByte $TcpSink(7) $b5"
    
# Run the simulation
proc finish {} {
	global ns namfile  
	$ns flush-trace
	close $namfile
         
        
        #exec xgraph -M -bg white -fg blue -t "Time VS Bandwidth" -x "Time" -y "Bandwidth"   -geometry 700*800 bw.tr &
        #exec xgraph -M -bg white -fg blue -t "Time VS Throughput" -x "Time" -y "Throughput" -geometry 700*800 th.tr & 
        
	##exec nam -r 100.000000us AODV_final.nam &	
	exit 0
	}
$ns at 10.000000 "finish"
$ns run
