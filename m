Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8378752A40
	for <meta-arago@arago-project.org>;
	Fri,  5 Jun 2015 15:34:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t55FYH9M002743;
	Fri, 5 Jun 2015 10:34:17 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t55FYHvo001553;
	Fri, 5 Jun 2015 10:34:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 5 Jun 2015 10:34:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t55FYHue032654;
	Fri, 5 Jun 2015 10:34:17 -0500
Date: Fri, 5 Jun 2015 11:34:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150605153416.GN27071@edge>
References: <CADnUhn0kCvX3JD4T2mfK9_ROdUmZOKPpTrAvobQhtcRy9bMXsw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn0kCvX3JD4T2mfK9_ROdUmZOKPpTrAvobQhtcRy9bMXsw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: am335x power management/dtb with fixed regulators
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
X-List-Received-Date: Fri, 05 Jun 2015 15:34:20 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I'd say this question is best suited for e2e forums:

https://e2e.ti.com/

-- 
Denys


On Fri, Jun 05, 2015 at 04:16:38PM +0300, matti kaasinen wrote:
> Hi!
> 
> This is  most likely a wrong forum. Please forward me to proper one if you
> know what.
> 
> I try to make am335x based board to running on linux-ti-staging_3.14.bb
> 
> Unfortunately this board has fixed regulators that am335 does not have any
> control at all. Board boots, but starts spitting following log:
> 
> (1) [    4.427294] cpu cpu0: of_pm_voltdm_notifier_register: Fail
> calculating voltage latency[1100000<->1260000]:-22
> (1b)[    4.455935] PM: Voltage scaling data blob not provided from DT.
> 
> (2) [    6.332180] clk_set_rate: failed to set dpll_mpu_ck rate
> (3)[    6.414665] cpu cpu0: clk_voltdm_notifier_handler: Failed to scale
> voltage(1100000): -22
> (4)[    6.422953] cpufreq_cpu0: failed to set clock rate: -16
> (5)[    6.428302] cpufreq: __cpufreq_driver_target: Failed to change cpu
> frequency: -16
> (6)[    6.764032] cpu cpu0: clk_voltdm_notifier_handler: Failed to scale
> voltage(1260000): -22
> 
> Thereafter log is repeting sequence (2)..(6)
> Places of log lines are as follows:
> (1)(3)(6): drivers/power/voltdm/core.c : of_pm_voltdm_notifier_register
> (2): drivers/clk/ti/clk.c : clk_set_rate
> (4): drivers/cpufreq/cpufreq-cpu0.c : __cpufreq_driver_target
> (5): drivers/cpufreq/cpufreq.c : __cpufreq_driver_target
> 
> Possibly initial call is coming from (5) and others are coming function
> calls inside next call etc.
> 
> In principle defconfig is defconfig of am335x-evm board with the exception
> that I have compiled
> 
> am335x-pm-firmware.elf in kernel.
> 
> I have defined device voltage regulators in device tree as follows:
> 
>     cpus {
>         cpu@0 {
>             cpu0-supply             = <&vmpu_fixed>;
>         };
>     }; /* cpu */
>     vmpu_fixed: fixedregulator@0 {
>         compatible                  = "regulator-fixed";
>         regulator-name              = "vdd_mpu";
>         regulator-min-microvolt     = <1100000>;
>         regulator-max-microvolt     = <1100000>;
>         regulator-always-on;
>         regulator-boot-on;
>     }; /* vmpu_fixed */
> 
> I have not defined any regulators with voltage 1260000 microvolts
> unlike log lists.
> 
> DT includes am33xx.dtsi, but I did not find that kind of definitions there.
> 
> Thanks,
> 
> Matti

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


