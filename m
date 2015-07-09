Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A27B25297D
	for <meta-arago@arago-project.org>;
	Thu,  9 Jul 2015 22:33:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t69MX1qP015657;
	Thu, 9 Jul 2015 17:33:01 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t69MX1en028854;
	Thu, 9 Jul 2015 17:33:01 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 9 Jul 2015 17:32:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t69MX1ft003328;
	Thu, 9 Jul 2015 17:33:01 -0500
Date: Thu, 9 Jul 2015 18:32:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: matti kaasinen <matti.kaasinen@gmail.com>
Message-ID: <20150709223245.GI15657@edge>
References: <CADnUhn0wGGsg7h+BEfRbGVHcu2pV2EzDC++wn_0KS_JYrGeCUw@mail.gmail.com>
	<CADnUhn3H=Gk7pTFxyVMc=pK758-OLinzLhJYrdv4Db=QjXq=sw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADnUhn3H=Gk7pTFxyVMc=pK758-OLinzLhJYrdv4Db=QjXq=sw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Deadlock while reading from TI-am335x-adc in_voltageX_raw sources
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
X-List-Received-Date: Thu, 09 Jul 2015 22:33:02 -0000
X-Groupsio-MsgNum: 5866
Content-Type: multipart/mixed; boundary="IJpNTDwzlM2Ie8A6"
Content-Disposition: inline

--IJpNTDwzlM2Ie8A6
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Matti,

First of all, this is the wrong mailing list for such question.

Nevertheless, here's a response from our kernel team:


The wiki that is being referred is obsolete for newer kernels. I have
now added a warning saying the page is obsolete.
Please follow [1] for v3.14+ kernels.
If multiple samples are required in quick successions then it is always
better to use continuous mode described in the above wiki.

Also, please try patches [2][3] (already in upstream kernel) and see if
this helps solve deadlock issue on 3.14.
Was this issue reproducible using mainline kernel?

[1] http://processors.wiki.ti.com/index.php/Linux_Core_ADC_User%27s_Guide
[2] Attached
[3] https://patchwork.kernel.org/patch/5582281/

-- 
Denys


On Wed, Jul 08, 2015 at 06:26:58PM +0300, matti kaasinen wrote:
> Some more information: distro poky/fido with meta-ti taken from Arago
> distribution/fido. Therefore, this kernel driver was coming from
> linux-ti-staging_3.14. Board is am2252 based board; very much simplified
> am335x-evm.
> -Matti
> 
> 2015-07-08 8:56 GMT+03:00 matti kaasinen <matti.kaasinen@gmail.com>:
> 
> > Hi!
> >
> > I'm experiencing a deadlock while using TI-am335x-adc sysfs interface. It
> > appears to happen when I read (i.e. cat) in_voltageX_raw files repeatedly.
> > For example, if I execute this with shell script that executes:
> >
> > while true; do
> > for i in 0 1 2 3; do
> > cat in_voltage${i}_raw; usleep 250000;
> > done;done
> >
> > I will eventually get lockup for a while and kernel panic with following
> > listing:
> > ----------- kernel panic listing -----------
> > root@am335x-evm:/sys/devices/ocp/44e0d000.tscadc/TI-am335x-adc/iio:device0#
> > cat in_voltage1_raw
> > [58197.968353] INFO: task cat:1629 blocked for more than 300 seconds.
> > [58197.974615] Not tainted 3.14.46 #1
> > [58197.978628] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
> > this message.
> > [58197.986504] cat D c06107d4 0 1629 1618 0x00000000
> > [58197.993021] [<c06107d4>] (__schedule) from [<c03a2008>]
> > (am335x_tsc_se_set_once+0xb0/0x100)
> > [58198.001491] [<c03a2008>] (am335x_tsc_se_set_once) from [<bf08653c>]
> > (tiadc_read_raw+0xb8/0x18c [ti_am335x_adc])
> > [58198.011698] [<bf08653c>] (tiadc_read_raw [ti_am335x_adc]) from
> > [<c0504b90>] (iio_read_channel_info+0x34/0x58)
> > [58198.021725] [<c0504b90>] (iio_read_channel_info) from [<c03814d8>]
> > (dev_attr_show+0x1c/0x48)
> > [58198.030260] [<c03814d8>] (dev_attr_show) from [<c0141270>]
> > (sysfs_kf_seq_show+0x80/0xf0)
> > [58198.038448] [<c0141270>] (sysfs_kf_seq_show) from [<c00ffb1c>]
> > (seq_read+0x1f0/0x4a4)
> > [58198.046377] [<c00ffb1c>] (seq_read) from [<c00df924>]
> > (do_readv_writev+0x1d4/0x214)
> > [58198.054124] [<c00df924>] (do_readv_writev) from [<c00df9a4>]
> > (vfs_readv+0x40/0x64)
> > [58198.061780] [<c00df9a4>] (vfs_readv) from [<c0106e84>]
> > (default_file_splice_read+0x204/0x308)
> > [58198.070391] [<c0106e84>] (default_file_splice_read) from [<c0105f98>]
> > (splice_direct_to_actor+0x8c/0x1d4)
> > [58198.080047] [<c0105f98>] (splice_direct_to_actor) from [<c0107390>]
> > (do_splice_direct+0x90/0xb8)
> > [58198.088919] [<c0107390>] (do_splice_direct) from [<c00df158>]
> > (do_sendfile+0x194/0x31c)
> > [58198.096979] [<c00df158>] (do_sendfile) from [<c00dfe2c>]
> > (SyS_sendfile64+0xd0/0xd4)
> > [58198.104727] [<c00dfe2c>] (SyS_sendfile64) from [<c000efe0>]
> > (ret_fast_syscall+0x0/0x38)
> > [58198.112802] INFO: lockdep is turned off.
> > [58198.116753] Kernel panic - not syncing: hung_task: blocked tasks
> > [58198.122797] CPU: 0 PID: 498 Comm: khungtaskd Not tainted 3.14.46 #1
> > [58198.129126] [<c0014ce8>] (unwind_backtrace) from [<c001219c>]
> > (show_stack+0x10/0x14)
> > [58198.136940] [<c001219c>] (show_stack) from [<c060b524>]
> > (panic+0x9c/0x1f0)
> > [58198.143870] [<c060b524>] (panic) from [<c008fab4>]
> > (watchdog+0x3a0/0x3f0)
> > [58198.150714] [<c008fab4>] (watchdog) from [<c00537a4>]
> > (kthread+0xcc/0xe0)
> > [58198.157549] [<c00537a4>] (kthread) from [<c000f080>]
> > (ret_from_fork+0x14/0x34)
> > [58797.599000] kmemleak: Cannot allocate a kmemleak_object structure
> >
> >
> > Above sequence will give every now and then "cat: read error: Device or
> > resource busy" errors, that is clearly listed in
> > wiki.tiprocessors.com/.../Processor_SDK_Linux_Kernel_Release_Notes
> > <http://wiki.tiprocessors.com/index.php/Processor_SDK_Linux_Kernel_Release_Notes>
> >
> > However, if I run the same sequence in c program, I will get much more of
> > these errors - like every thirth reading will fail.
> >
> > Third thing to note is that there is no mode (= continuous/single shot)
> > node in sysfs
> > (/sys/bus/iio/devices/iio:device0/mode) that should be there according to
> > http://processors.wiki.ti.com/index.php/AM335x_ADC_Driver%27s_Guide
> >
> > Thanks,
> > Matti
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--IJpNTDwzlM2Ie8A6
Content-Type: text/x-diff; charset="us-ascii"
Content-Disposition: attachment; filename=
	"0001-Input-ti_am335x_tsc-remove-udelay-in-interrupt-handler.patch"

Subject: [3.14, v4, 2/3] Input: ti_am335x_tsc - remove udelay in interrupt handler (mainline sync)
Date: Sat, 13 Jun 2015 00:13:26 -0000
From: Franklin Cooper <fcooper@ti.com>
X-Patchwork-Id: 14228

TI 3.14 Patch e823ec6f7b5555c65b2b89742fcd705014e8e467 was an early version of
mainline patch 344d635b9a41b19837ccf8083a99ea688027019c.

Backport the differences between these patches.

Signed-off-by: Franklin S Cooper Jr <fcooper@ti.com>

---
Version 2 and 4 changes:
None

 drivers/input/touchscreen/ti_am335x_tsc.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/input/touchscreen/ti_am335x_tsc.c b/drivers/input/touchscreen/ti_am335x_tsc.c
index 40f1fad..b38e047 100644
--- a/drivers/input/touchscreen/ti_am335x_tsc.c
+++ b/drivers/input/touchscreen/ti_am335x_tsc.c
@@ -260,7 +260,7 @@ static irqreturn_t titsc_irq(int irq, void *dev)
 {
 	struct titsc *ts_dev = dev;
 	struct input_dev *input_dev = ts_dev->input;
-	unsigned int status, irqclr = 0;
+	unsigned int fsm, status, irqclr = 0;
 	unsigned int x = 0, y = 0;
 	unsigned int z1, z2, z;
 
@@ -271,10 +271,15 @@ static irqreturn_t titsc_irq(int irq, void *dev)
 	}
 
 	if (status & IRQENB_PENUP) {
-		ts_dev->pen_down = false;
-		input_report_key(input_dev, BTN_TOUCH, 0);
-		input_report_abs(input_dev, ABS_PRESSURE, 0);
-		input_sync(input_dev);
+		fsm = titsc_readl(ts_dev, REG_ADCFSM);
+		if (fsm == ADCFSM_STEPID) {
+			ts_dev->pen_down = false;
+			input_report_key(input_dev, BTN_TOUCH, 0);
+			input_report_abs(input_dev, ABS_PRESSURE, 0);
+			input_sync(input_dev);
+		} else {
+			ts_dev->pen_down = true;
+		}
 		irqclr |= IRQENB_PENUP;
 	}
 
@@ -313,7 +318,9 @@ static irqreturn_t titsc_irq(int irq, void *dev)
 	}
 	if (irqclr) {
 		titsc_writel(ts_dev, REG_IRQSTATUS, irqclr);
-		am335x_tsc_se_set_cache(ts_dev->mfd_tscadc, ts_dev->step_mask);
+		if (status & IRQENB_EOS)
+			am335x_tsc_se_set_cache(ts_dev->mfd_tscadc,
+						ts_dev->step_mask);
 		return IRQ_HANDLED;
 	}
 	return IRQ_NONE;

--IJpNTDwzlM2Ie8A6--
