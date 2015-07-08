Return-Path: <matti.kaasinen@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by arago-project.org (Postfix) with ESMTPS id 3B84752987
	for <meta-arago@arago-project.org>;
	Wed,  8 Jul 2015 05:57:00 +0000 (UTC)
Received: by igcsj18 with SMTP id sj18so279052271igc.1
	for <meta-arago@arago-project.org>;
	Tue, 07 Jul 2015 22:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1jsTu5sRsBi9xvVvcX/1NxqLTPzz6meM1iJQqkRUwRI=;
	b=WRdvBoY4RHQDjaQYbk64NnqTQH0BQZz9eNj8cpPAxG70UwpFYFbnBoANLh2ipvUtSN
	Rlh4SN9ALGH4tgiIuU4njXriVc217tCUu2pic/jiLxzXwN4M+PQvI7jJ42J22O/wYlQc
	98YJZfLBwF8smTIOuWVpJ5spmSef1t+ebwgwhIUh42oxy1uMvSpjWs8TkCkGdIBIvlXM
	Te0wHi9ycJWD/FPuZ9pjDAihCG5SwlzvP5cU1PcRbe2Z7wqWtkc7aI3jYx/SXeemUI+K
	mMCE25vdLbVj6aE3HfIdkAH6zevkX26n7qRpAUrZxn0KGaAN6Nv9O82kRGsxskVtHsbf
	s1OQ==
MIME-Version: 1.0
X-Received: by 10.107.128.214 with SMTP id k83mr13017274ioi.7.1436335019281;
	Tue, 07 Jul 2015 22:56:59 -0700 (PDT)
Received: by 10.36.1.197 with HTTP; Tue, 7 Jul 2015 22:56:59 -0700 (PDT)
Date: Wed, 8 Jul 2015 08:56:59 +0300
Message-ID: <CADnUhn0wGGsg7h+BEfRbGVHcu2pV2EzDC++wn_0KS_JYrGeCUw@mail.gmail.com>
From: matti kaasinen <matti.kaasinen@gmail.com>
To: meta-arago@arago-project.org
Subject: Deadlock while reading from TI-am335x-adc in_voltageX_raw sources
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
X-List-Received-Date: Wed, 08 Jul 2015 05:57:01 -0000
Content-Type: multipart/alternative; boundary=001a113f97d89a56cd051a56ce53

--001a113f97d89a56cd051a56ce53
Content-Type: text/plain; charset=UTF-8

Hi!

I'm experiencing a deadlock while using TI-am335x-adc sysfs interface. It
appears to happen when I read (i.e. cat) in_voltageX_raw files repeatedly.
For example, if I execute this with shell script that executes:

while true; do
for i in 0 1 2 3; do
cat in_voltage${i}_raw; usleep 250000;
done;done

I will eventually get lockup for a while and kernel panic with following
listing:
----------- kernel panic listing -----------
root@am335x-evm:/sys/devices/ocp/44e0d000.tscadc/TI-am335x-adc/iio:device0#
cat in_voltage1_raw
[58197.968353] INFO: task cat:1629 blocked for more than 300 seconds.
[58197.974615] Not tainted 3.14.46 #1
[58197.978628] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[58197.986504] cat D c06107d4 0 1629 1618 0x00000000
[58197.993021] [<c06107d4>] (__schedule) from [<c03a2008>]
(am335x_tsc_se_set_once+0xb0/0x100)
[58198.001491] [<c03a2008>] (am335x_tsc_se_set_once) from [<bf08653c>]
(tiadc_read_raw+0xb8/0x18c [ti_am335x_adc])
[58198.011698] [<bf08653c>] (tiadc_read_raw [ti_am335x_adc]) from
[<c0504b90>] (iio_read_channel_info+0x34/0x58)
[58198.021725] [<c0504b90>] (iio_read_channel_info) from [<c03814d8>]
(dev_attr_show+0x1c/0x48)
[58198.030260] [<c03814d8>] (dev_attr_show) from [<c0141270>]
(sysfs_kf_seq_show+0x80/0xf0)
[58198.038448] [<c0141270>] (sysfs_kf_seq_show) from [<c00ffb1c>]
(seq_read+0x1f0/0x4a4)
[58198.046377] [<c00ffb1c>] (seq_read) from [<c00df924>]
(do_readv_writev+0x1d4/0x214)
[58198.054124] [<c00df924>] (do_readv_writev) from [<c00df9a4>]
(vfs_readv+0x40/0x64)
[58198.061780] [<c00df9a4>] (vfs_readv) from [<c0106e84>]
(default_file_splice_read+0x204/0x308)
[58198.070391] [<c0106e84>] (default_file_splice_read) from [<c0105f98>]
(splice_direct_to_actor+0x8c/0x1d4)
[58198.080047] [<c0105f98>] (splice_direct_to_actor) from [<c0107390>]
(do_splice_direct+0x90/0xb8)
[58198.088919] [<c0107390>] (do_splice_direct) from [<c00df158>]
(do_sendfile+0x194/0x31c)
[58198.096979] [<c00df158>] (do_sendfile) from [<c00dfe2c>]
(SyS_sendfile64+0xd0/0xd4)
[58198.104727] [<c00dfe2c>] (SyS_sendfile64) from [<c000efe0>]
(ret_fast_syscall+0x0/0x38)
[58198.112802] INFO: lockdep is turned off.
[58198.116753] Kernel panic - not syncing: hung_task: blocked tasks
[58198.122797] CPU: 0 PID: 498 Comm: khungtaskd Not tainted 3.14.46 #1
[58198.129126] [<c0014ce8>] (unwind_backtrace) from [<c001219c>]
(show_stack+0x10/0x14)
[58198.136940] [<c001219c>] (show_stack) from [<c060b524>]
(panic+0x9c/0x1f0)
[58198.143870] [<c060b524>] (panic) from [<c008fab4>] (watchdog+0x3a0/0x3f0)
[58198.150714] [<c008fab4>] (watchdog) from [<c00537a4>] (kthread+0xcc/0xe0)
[58198.157549] [<c00537a4>] (kthread) from [<c000f080>]
(ret_from_fork+0x14/0x34)
[58797.599000] kmemleak: Cannot allocate a kmemleak_object structure


Above sequence will give every now and then "cat: read error: Device or
resource busy" errors, that is clearly listed in
wiki.tiprocessors.com/.../Processor_SDK_Linux_Kernel_Release_Notes
<http://wiki.tiprocessors.com/index.php/Processor_SDK_Linux_Kernel_Release_Notes>

However, if I run the same sequence in c program, I will get much more of
these errors - like every thirth reading will fail.

Third thing to note is that there is no mode (= continuous/single shot)
node in sysfs
(/sys/bus/iio/devices/iio:device0/mode) that should be there according to
http://processors.wiki.ti.com/index.php/AM335x_ADC_Driver%27s_Guide

Thanks,
Matti

--001a113f97d89a56cd051a56ce53
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hi!<br><br></div>I&#39;m exp=
eriencing a deadlock while using TI-am335x-adc sysfs interface. It appears =
to happen when I read (i.e. cat) in_voltageX_raw files repeatedly. For exam=
ple, if I execute this with shell script that executes:<br><br>while true; =
do<br>for i in 0 1 2 3; do<br>cat in_voltage${i}_raw; usleep 250000;<br></d=
iv>done;done<br><br></div>I will eventually get lockup for a while and kern=
el panic with following listing:<br>----------- kernel panic listing ------=
-----<br>
root@am335x-evm:/sys/devices/ocp/44e0d000.tscadc/TI-am335x-adc/iio:device0#=
 cat in_voltage1_raw<br>
[58197.968353] INFO: task cat:1629 blocked for more than 300 seconds.<br>
[58197.974615]       Not tainted 3.14.46 #1<br>
[58197.978628] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&qu=
ot; disables this message.<br>
[58197.986504] cat             D c06107d4     0  1629   1618 0x00000000<br>
[58197.993021] [&lt;c06107d4&gt;] (__schedule) from [&lt;c03a2008&gt;] (am3=
35x_tsc_se_set_once+0xb0/0x100)<br>
[58198.001491] [&lt;c03a2008&gt;] (am335x_tsc_se_set_once) from [&lt;bf0865=
3c&gt;] (tiadc_read_raw+0xb8/0x18c [ti_am335x_adc])<br>
[58198.011698] [&lt;bf08653c&gt;] (tiadc_read_raw [ti_am335x_adc]) from [&l=
t;c0504b90&gt;] (iio_read_channel_info+0x34/0x58)<br>
[58198.021725] [&lt;c0504b90&gt;] (iio_read_channel_info) from [&lt;c03814d=
8&gt;] (dev_attr_show+0x1c/0x48)<br>
[58198.030260] [&lt;c03814d8&gt;] (dev_attr_show) from [&lt;c0141270&gt;] (=
sysfs_kf_seq_show+0x80/0xf0)<br>
[58198.038448] [&lt;c0141270&gt;] (sysfs_kf_seq_show) from [&lt;c00ffb1c&gt=
;] (seq_read+0x1f0/0x4a4)<br>
[58198.046377] [&lt;c00ffb1c&gt;] (seq_read) from [&lt;c00df924&gt;] (do_re=
adv_writev+0x1d4/0x214)<br>
[58198.054124] [&lt;c00df924&gt;] (do_readv_writev) from [&lt;c00df9a4&gt;]=
 (vfs_readv+0x40/0x64)<br>
[58198.061780] [&lt;c00df9a4&gt;] (vfs_readv) from [&lt;c0106e84&gt;] (defa=
ult_file_splice_read+0x204/0x308)<br>
[58198.070391] [&lt;c0106e84&gt;] (default_file_splice_read) from [&lt;c010=
5f98&gt;] (splice_direct_to_actor+0x8c/0x1d4)<br>
[58198.080047] [&lt;c0105f98&gt;] (splice_direct_to_actor) from [&lt;c01073=
90&gt;] (do_splice_direct+0x90/0xb8)<br>
[58198.088919] [&lt;c0107390&gt;] (do_splice_direct) from [&lt;c00df158&gt;=
] (do_sendfile+0x194/0x31c)<br>
[58198.096979] [&lt;c00df158&gt;] (do_sendfile) from [&lt;c00dfe2c&gt;] (Sy=
S_sendfile64+0xd0/0xd4)<br>
[58198.104727] [&lt;c00dfe2c&gt;] (SyS_sendfile64) from [&lt;c000efe0&gt;] =
(ret_fast_syscall+0x0/0x38)<br>
[58198.112802] INFO: lockdep is turned off.<br>
[58198.116753] Kernel panic - not syncing: hung_task: blocked tasks<br>
[58198.122797] CPU: 0 PID: 498 Comm: khungtaskd Not tainted 3.14.46 #1<br>
[58198.129126] [&lt;c0014ce8&gt;] (unwind_backtrace) from [&lt;c001219c&gt;=
] (show_stack+0x10/0x14)<br>
[58198.136940] [&lt;c001219c&gt;] (show_stack) from [&lt;c060b524&gt;] (pan=
ic+0x9c/0x1f0)<br>
[58198.143870] [&lt;c060b524&gt;] (panic) from [&lt;c008fab4&gt;] (watchdog=
+0x3a0/0x3f0)<br>
[58198.150714] [&lt;c008fab4&gt;] (watchdog) from [&lt;c00537a4&gt;] (kthre=
ad+0xcc/0xe0)<br>
[58198.157549] [&lt;c00537a4&gt;] (kthread) from [&lt;c000f080&gt;] (ret_fr=
om_fork+0x14/0x34)<br>
[58797.599000] kmemleak: Cannot allocate a kmemleak_object structure<br>
<br><br></div>Above sequence will give every now and then &quot;cat: read e=
rror: Device or resource busy&quot; errors, that is clearly listed in <a hr=
ef=3D"http://wiki.tiprocessors.com/index.php/Processor_SDK_Linux_Kernel_Rel=
ease_Notes">wiki.tiprocessors.com/.../Processor_SDK_Linux_Kernel_Release_No=
tes</a><br><br>However, if I run the same sequence in c program, I will get=
 much more of these errors - like every thirth reading will fail.<br><br>Th=
ird thing to note is that there is no mode (=3D continuous/single shot) nod=
e in sysfs <br>(/sys/bus/iio/devices/iio:device0/mode) that should be there=
 according to <a title=3D"AM335x ADC Driver&#39;s Guide" href=3D"http://pro=
cessors.wiki.ti.com/index.php/AM335x_ADC_Driver%27s_Guide">http://processor=
s.wiki.ti.com/index.php/AM335x_ADC_Driver%27s_Guide</a><br><br></div>Thanks=
,<br></div>Matti<br></div>

--001a113f97d89a56cd051a56ce53--
