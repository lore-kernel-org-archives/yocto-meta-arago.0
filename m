Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by arago-project.org (Postfix) with ESMTPS id 1784F529A7
	for <meta-arago@arago-project.org>;
	Fri,  5 Jun 2015 13:16:39 +0000 (UTC)
Received: by igblz2 with SMTP id lz2so14303154igb.1
	for <meta-arago@arago-project.org>;
	Fri, 05 Jun 2015 06:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=NFD1+qVN25Q1oK8+eybOght6UZ9DW9l36erRZuSFFYg=;
	b=eanyE5lx1oD6qScZXEpk4to1VyU4sZ3uh5GkLK0V6yLNgO3CYoPkROS310XmtRuEnD
	6fPS+nvyTZA5hOaJUs/n6qxxU2kRJBxNuCc9+d4eeHYMXe7EeUTXzVQR/Fxo9ceRHhhh
	hGFB5cR4ghGcfZgyGyMpW98hkztgD7BnWSxqf4AQh2qJkc+/SA6/i+ZKS52twsQlciib
	ppRFJmcpmV/dxCbUuXj0DASTDqIkBnX4uee2SYhei02mA+J6odQV7+MqSicMaWK46WMk
	5h7Se/ZM5FUIU88hJMZqdQDi1tKE1CJraYatEuhR6keEKXzZNKzK4W+RSd0/1MF8DM6v
	X7og==
MIME-Version: 1.0
X-Received: by 10.42.213.136 with SMTP id gw8mr10190700icb.95.1433510198496;
	Fri, 05 Jun 2015 06:16:38 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Fri, 5 Jun 2015 06:16:38 -0700 (PDT)
Date: Fri, 5 Jun 2015 16:16:38 +0300
Message-ID: <CADnUhn0kCvX3JD4T2mfK9_ROdUmZOKPpTrAvobQhtcRy9bMXsw@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: am335x power management/dtb with fixed regulators
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Jun 2015 13:16:39 -0000
Content-Type: multipart/alternative; boundary=001a11c3170029d5c10517c51a6f

--001a11c3170029d5c10517c51a6f
Content-Type: text/plain; charset=UTF-8

Hi!

This is  most likely a wrong forum. Please forward me to proper one if you
know what.

I try to make am335x based board to running on linux-ti-staging_3.14.bb

Unfortunately this board has fixed regulators that am335 does not have any
control at all. Board boots, but starts spitting following log:

(1) [    4.427294] cpu cpu0: of_pm_voltdm_notifier_register: Fail
calculating voltage latency[1100000<->1260000]:-22
(1b)[    4.455935] PM: Voltage scaling data blob not provided from DT.

(2) [    6.332180] clk_set_rate: failed to set dpll_mpu_ck rate
(3)[    6.414665] cpu cpu0: clk_voltdm_notifier_handler: Failed to scale
voltage(1100000): -22
(4)[    6.422953] cpufreq_cpu0: failed to set clock rate: -16
(5)[    6.428302] cpufreq: __cpufreq_driver_target: Failed to change cpu
frequency: -16
(6)[    6.764032] cpu cpu0: clk_voltdm_notifier_handler: Failed to scale
voltage(1260000): -22

Thereafter log is repeting sequence (2)..(6)
Places of log lines are as follows:
(1)(3)(6): drivers/power/voltdm/core.c : of_pm_voltdm_notifier_register
(2): drivers/clk/ti/clk.c : clk_set_rate
(4): drivers/cpufreq/cpufreq-cpu0.c : __cpufreq_driver_target
(5): drivers/cpufreq/cpufreq.c : __cpufreq_driver_target

Possibly initial call is coming from (5) and others are coming function
calls inside next call etc.

In principle defconfig is defconfig of am335x-evm board with the exception
that I have compiled

am335x-pm-firmware.elf in kernel.

I have defined device voltage regulators in device tree as follows:

    cpus {
        cpu@0 {
            cpu0-supply             = <&vmpu_fixed>;
        };
    }; /* cpu */
    vmpu_fixed: fixedregulator@0 {
        compatible                  = "regulator-fixed";
        regulator-name              = "vdd_mpu";
        regulator-min-microvolt     = <1100000>;
        regulator-max-microvolt     = <1100000>;
        regulator-always-on;
        regulator-boot-on;
    }; /* vmpu_fixed */

I have not defined any regulators with voltage 1260000 microvolts
unlike log lists.

DT includes am33xx.dtsi, but I did not find that kind of definitions there.

Thanks,

Matti

--001a11c3170029d5c10517c51a6f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi!<br><br></div>This is=C2=A0 mo=
st likely a wrong forum. Please forward me to proper one if you know what.<=
br><br></div>I try to make am335x based board to running on <a href=3D"http=
://linux-ti-staging_3.14.bb">linux-ti-staging_3.14.bb</a><br><br></div>Unfo=
rtunately this board has fixed regulators that am335 does not have any cont=
rol at all. Board boots, but starts spitting following log:<br><br>(1) [=C2=
=A0=C2=A0=C2=A0 4.427294] cpu cpu0: of_pm_voltdm_notifier_register: Fail ca=
lculating voltage latency[1100000&lt;-&gt;1260000]:-22<br>(1b)[=C2=A0=C2=A0=
=C2=A0 4.455935] PM: Voltage scaling data blob not provided from DT.<br><br=
>(2) [=C2=A0=C2=A0=C2=A0 6.332180] clk_set_rate: failed to set dpll_mpu_ck =
rate<br>(3)[=C2=A0=C2=A0=C2=A0 6.414665] cpu cpu0: clk_voltdm_notifier_hand=
ler: Failed to scale voltage(1100000): -22<br>(4)[=C2=A0=C2=A0=C2=A0 6.4229=
53] cpufreq_cpu0: failed to set clock rate: -16<br>(5)[=C2=A0=C2=A0=C2=A0 6=
.428302] cpufreq: __cpufreq_driver_target: Failed to change cpu frequency: =
-16<br>(6)[=C2=A0=C2=A0=C2=A0 6.764032] cpu cpu0: clk_voltdm_notifier_handl=
er: Failed to scale voltage(1260000): -22<br><br>Thereafter log is repeting=
 sequence (2)..(6)<br>Places of log lines are as follows:<br>(1)(3)(6): dri=
vers/power/voltdm/core.c : of_pm_voltdm_notifier_register<br>(2): drivers/c=
lk/ti/clk.c : clk_set_rate<br>(4): drivers/cpufreq/cpufreq-cpu0.c : __cpufr=
eq_driver_target<br><span style=3D"font-family:arial,helvetica,sans-serif">=
(5): drivers/cpufreq/cpufreq.c : __cpufreq_driver_target<br><br></span></di=
v><span style=3D"font-family:arial,helvetica,sans-serif">Possibly initial c=
all is coming from (5) and others are coming function calls inside next cal=
l etc.<br><br></span></div><span style=3D"font-family:arial,helvetica,sans-=
serif">In principle defconfig is defconfig of am335x-evm board with the exc=
eption that I have compiled <br></span><pre><span style=3D"font-family:aria=
l,helvetica,sans-serif">am335x-pm-firmware.elf in kernel.<br><font size=3D"=
2"><br></font></span></pre><pre><span style=3D"font-family:arial,helvetica,=
sans-serif"><font size=3D"2">I have defined device voltage regulators in de=
vice tree as follows:<br><br>    cpus {<br>        cpu@0 {<br>            c=
pu0-supply             =3D &lt;&amp;vmpu_fixed&gt;;<br>        };<br>    };=
 /* cpu */<br>    vmpu_fixed: fixedregulator@0 {<br>        compatible     =
             =3D &quot;regulator-fixed&quot;;<br>        regulator-name    =
          =3D &quot;vdd_mpu&quot;;<br>        regulator-min-microvolt     =
=3D &lt;1100000&gt;;<br>        regulator-max-microvolt     =3D &lt;1100000=
&gt;;<br>        regulator-always-on;<br>        regulator-boot-on;<br>    =
}; /* vmpu_fixed */<br><br></font></span></pre><pre><span style=3D"font-fam=
ily:arial,helvetica,sans-serif"><font size=3D"2">I have not defined any reg=
ulators with voltage 1260000 microvolts unlike log lists. <br></font></span=
></pre><pre><span style=3D"font-family:arial,helvetica,sans-serif">DT inclu=
des am33xx.dtsi, but I did not find that kind of definitions there.</span><=
br><br></pre><pre>Thanks,<br></pre><pre>Matti<br></pre></div>

--001a11c3170029d5c10517c51a6f--
