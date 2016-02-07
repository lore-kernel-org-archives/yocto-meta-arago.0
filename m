Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by arago-project.org (Postfix) with ESMTPS id 5F9ED52AAE
	for <meta-arago@arago-project.org>;
	Sun,  7 Feb 2016 11:15:09 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id c3so34024792vkb.3
	for <meta-arago@arago-project.org>;
	Sun, 07 Feb 2016 03:15:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=31iepH8QTOZ+LyoRHRsmxyJUfZKZTB9Gg7QCk/OCFcE=;
	b=FXHlZsFjRskctPuPEOYHBmKmftiXY+VfbczF7MCoLi/9uS+FTrkYQdUUJFcozALDuJ
	oay4W4iK+1r+9FpFS+ArJ71JA6/Zhf06W5KfRMCkrrgPSGoB2OeJIEQULX+OyNB0iml1
	q9knTwU7zJyUDKblCEhZX5mjumlNTuHQpOaUVVCImeFLmNMlbcDNLMafEobh4Ag93eZR
	7BFiKCXyx7VkxK48knf3yzGmrQK+gtGkdTq7sGwWB+7xngODqOfaDhB3M/6Xct7ez/gN
	aFsTXXMNST84EnVxW4ogbgTryXjbe/8deGUS8SyNBxNkuU/N071PvBdG4M/IqRC55ytQ
	XksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to
	:content-type;
	bh=31iepH8QTOZ+LyoRHRsmxyJUfZKZTB9Gg7QCk/OCFcE=;
	b=Ln1BgiHautaLiT6w4LHlx7NO90jvY2Exn2SyulmpISjLgXTMVQKZoNT5LnzjYqQzfx
	ULdQRRc4MzmNzWUa0Ia6qpHq6HGGfBijmWYzFoBw1cNhnLoM6mtEb3HFaZf6tX+b0R/T
	brwUewJpmql2kfflhIrx9Cj96eefndZ6udcjhV+lBWr+HA5aQbNJY3ov6iKBaofhbRrs
	BQPAb4YvoRiOno8ist7jBV0eX2pMZyUPJ5XK1LaNqJPYm4rSSTx3wbMb3NQlI4a5eh+A
	DIZr2vS2t7VkDVLt1ONSkioP9bJLqjnEiHZk1CtXRYKdW800uYPklQiymWfLBNbUaY+E
	qvBQ==
X-Gm-Message-State: AG10YOShC6oVnPu1pnjxrZ+GZCJaTO5t2IsrDQ7Xw8nf8d4O/WOzUJeJrb0MwMguTqTkR2Ogu7TN/IhkZQ5D5Q==
X-Received: by 10.31.147.82 with SMTP id v79mr14900750vkd.58.1454843708673;
	Sun, 07 Feb 2016 03:15:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.146.65 with HTTP; Sun, 7 Feb 2016 03:14:49 -0800 (PST)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Mon, 8 Feb 2016 00:14:49 +1300
Message-ID: <CADySD0F+tj+rhSndxFqpvV98gjx9KVfcrXtqJpY0frepha7p0w@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: drm error when exiting from QT5 application on AM335x EVM with fido branch
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
X-List-Received-Date: Sun, 07 Feb 2016 11:15:09 -0000
Content-Type: multipart/alternative; boundary=001a1141dca2759af8052b2c32fe

--001a1141dca2759af8052b2c32fe
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

When I quit from my QT5 application on am335x-evm running distro from
arago-fido branch, I get following back trace:

[   61.645940] WARNING: CPU: 0 PID: 1152 at
/home/nws/yocto-fido-dev/oe-layersetup/build/arago-tmp-external-linaro-tool=
chain/work-shared/am335x-evm/kernel-source/mm/page_alloc.c:6523
free_contig_range+0xa0/0xb8()
[   61.666185] 375 pages are still in use!
[   61.670076] Modules linked in: ipv6 usb_f_ecm g_ether usb_f_rndis
u_ether libcomposite musb_dsps musb_hdrc udc_core usbcore gpio_keys
snd_soc_evm pm33xx omapdrm_pvr(O) omap_aes_driver omap_sham evdev joydev
lm75 snd_soc_tlv320aic3x ti_am335x_adc omap_rng kfifo_buf rng_core
industrialio musb_am335x rtc_omap omap_wdt matrix_keypad matrix_keymap
[   61.701652] CPU: 0 PID: 1152 Comm: QSGRenderThread Tainted: G
O    4.1.17-g6c8d9c4682 #1
[   61.711300] Hardware name: Generic AM33XX (Flattened Device Tree)
[   61.718176] Backtrace:
[   61.720694] [<c0012b18>] (dump_backtrace) from [<c0012d38>]
(show_stack+0x18/0x1c)
[   61.728774]  r7:c0803bb0 r6:0000197b r5:00000009 r4:00000000
[   61.734524] [<c0012d20>] (show_stack) from [<c067b95c>]
(dump_stack+0x20/0x28)
[   61.742131] [<c067b93c>] (dump_stack) from [<c0035d14>]
(warn_slowpath_common+0x7c/0xb4)
[   61.750312] [<c0035c98>] (warn_slowpath_common) from [<c0035d84>]
(warn_slowpath_fmt+0x38/0x40)
[   61.759341]  r8:c0904580 r7:00000177 r6:c095d58c r5:000bec77 r4:c080438c
[   61.766201] [<c0035d50>] (warn_slowpath_fmt) from [<c00c1048>]
(free_contig_range+0xa0/0xb8)
[   61.774677]  r3:00000177 r2:c080438c
[   61.778612]  r4:00000000
[   61.781185] [<c00c0fa8>] (free_contig_range) from [<c0101614>]
(cma_release+0x94/0xbc)
[   61.789483]  r9:eeef9000 r8:f07a9000 r7:ee0fc610 r6:00000001 r5:c095e3c4
r4:000beb00
[   61.797368] [<c0101580>] (cma_release) from [<c03fdc8c>]
(dma_release_from_contiguous+0x34/0x3c)
[   61.806449]  r5:008d0c00 r4:00177000
[   61.810089] [<c03fdc58>] (dma_release_from_contiguous) from [<c001af14>]
(__arm_dma_free+0x14c/0x1f8)
[   61.819658] [<c001adc8>] (__arm_dma_free) from [<c001b010>]
(arm_dma_free+0x24/0x2c)
[   61.827466]  r10:00000001 r9:c03c29f8 r8:ed02e080 r7:00000001
r6:ee206c00 r5:c001afec
[   61.835624]  r4:ed02e480
[   61.838209] [<c001afec>] (arm_dma_free) from [<c03de978>]
(drm_gem_cma_free_object+0x5c/0x98)
[   61.847049] [<c03de91c>] (drm_gem_cma_free_object) from [<c03c2780>]
(drm_gem_object_free+0x30/0x38)
[   61.856255]  r5:ee206c34 r4:ed02e480
[   61.859872] [<c03c2750>] (drm_gem_object_free) from [<c03c286c>]
(drm_gem_object_handle_unreference_unlocked+0xe4/0x114)
[   61.871318] [<c03c2788>] (drm_gem_object_handle_unreference_unlocked)
from [<c03c2a50>] (drm_gem_object_release_handle+0x58/0x70)
[   61.883071]  r5:ed02e080 r4:ed02e480
[   61.886908] [<c03c29f8>] (drm_gem_object_release_handle) from
[<c02d4bbc>] (idr_for_each+0xac/0xe0)
[   61.896256]  r7:00000001 r6:000000ff r5:ec209d50 r4:00000000
[   61.901992] [<c02d4b10>] (idr_for_each) from [<c03c3104>]
(drm_gem_release+0x20/0x30)
[   61.910107]  r10:ed02e0dc r9:ee206c34 r8:ee206cc4 r7:ee206cc0
r6:ee206c00 r5:ed02e0e0
[   61.918075]  r4:ed02e0a0
[   61.920651] [<c03c30e4>] (drm_gem_release) from [<c03c1e50>]
(drm_release+0x378/0x518)
[   61.928926]  r5:ed02e0e0 r4:ed02e080
[   61.932560] [<c03c1ad8>] (drm_release) from [<c0104fbc>]
(__fput+0x88/0x20c)
[   61.939897]  r10:ed18bd88 r9:00000008 r8:ee293020 r7:00000000
r6:ee40d6d0 r5:ed812bb0
[   61.947834]  r4:ed18bd80
[   61.950399] [<c0104f34>] (__fput) from [<c0105198>] (____fput+0x10/0x14)
[   61.957430]  r10:08430000 r9:ee6c43b4 r8:ee6c4380 r7:ed309a28
r6:c094330c r5:ed309680
[   61.965394]  r4:ed18ba80
[   61.967970] [<c0105188>] (____fput) from [<c004dfc0>]
(task_work_run+0x94/0xc4)
[   61.975649] [<c004df2c>] (task_work_run) from [<c0037c94>]
(do_exit+0x2e0/0x9a8)
[   61.983084]  r7:00000001 r6:ec209edc r5:00000000 r4:ed309680
[   61.988995] [<c00379b4>] (do_exit) from [<c00383dc>]
(do_group_exit+0x44/0xf8)
[   61.996493]  r7:ee7179c0
[   61.999071] [<c0038398>] (do_group_exit) from [<c0042140>]
(get_signal+0x2e4/0x700)
[   62.007052]  r5:00418004 r4:00000009
[   62.010686] [<c0041e5c>] (get_signal) from [<c00122b0>]
(do_signal+0x6c/0x3cc)
[   62.018606]  r10:00000000 r9:ec208000 r8:fffffe00 r7:b5836b16
r6:ec209ec8 r5:b5836b14
[   62.026535]  r4:ec209fb0 r3:002a4c8c
[   62.030149] [<c0012244>] (do_signal) from [<c00127d4>]
(do_work_pending+0xa4/0xb4)
[   62.037996]  r10:00000000 r9:ec208000 r8:c000fa24 r7:000000f0
r6:ec209fb0 r5:c000fa24
[   62.045911]  r4:ec208000
[   62.048465] [<c0012730>] (do_work_pending) from [<c000f8cc>]
(work_pending+0xc/0x20)
[   62.056455]  r7:000000f0 r6:0000000f r5:00000000 r4:002a4c88
[   62.062161] ---[ end trace e8a7009dde5ddb7c ]---

=E2=80=8Bthanks
Ankur

--001a1141dca2759af8052b2c32fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br>When I quit from my QT5 application on am335x-e=
vm running distro from arago-fido branch, I get following back trace:<br><b=
r>[ =C2=A0 61.645940] WARNING: CPU: 0 PID: 1152 at /home/nws/yocto-fido-dev=
/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work-shared/am335x=
-evm/kernel-source/mm/page_alloc.c:6523 free_contig_range+0xa0/0xb8()<br>[ =
=C2=A0 61.666185] 375 pages are still in use!<br>[ =C2=A0 61.670076] Module=
s linked in: ipv6 usb_f_ecm g_ether usb_f_rndis u_ether libcomposite musb_d=
sps musb_hdrc udc_core usbcore gpio_keys snd_soc_evm pm33xx omapdrm_pvr(O) =
omap_aes_driver omap_sham evdev joydev lm75 snd_soc_tlv320aic3x ti_am335x_a=
dc omap_rng kfifo_buf rng_core industrialio musb_am335x rtc_omap omap_wdt m=
atrix_keypad matrix_keymap<br>[ =C2=A0 61.701652] CPU: 0 PID: 1152 Comm: QS=
GRenderThread Tainted: G =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 O =C2=A0 =C2=A0=
4.1.17-g6c8d9c4682 #1<br>[ =C2=A0 61.711300] Hardware name: Generic AM33XX =
(Flattened Device Tree)<br>[ =C2=A0 61.718176] Backtrace:<br>[ =C2=A0 61.72=
0694] [&lt;c0012b18&gt;] (dump_backtrace) from [&lt;c0012d38&gt;] (show_sta=
ck+0x18/0x1c)<br>[ =C2=A0 61.728774] =C2=A0r7:c0803bb0 r6:0000197b r5:00000=
009 r4:00000000<br>[ =C2=A0 61.734524] [&lt;c0012d20&gt;] (show_stack) from=
 [&lt;c067b95c&gt;] (dump_stack+0x20/0x28)<br>[ =C2=A0 61.742131] [&lt;c067=
b93c&gt;] (dump_stack) from [&lt;c0035d14&gt;] (warn_slowpath_common+0x7c/0=
xb4)<br>[ =C2=A0 61.750312] [&lt;c0035c98&gt;] (warn_slowpath_common) from =
[&lt;c0035d84&gt;] (warn_slowpath_fmt+0x38/0x40)<br>[ =C2=A0 61.759341] =C2=
=A0r8:c0904580 r7:00000177 r6:c095d58c r5:000bec77 r4:c080438c<br>[ =C2=A0 =
61.766201] [&lt;c0035d50&gt;] (warn_slowpath_fmt) from [&lt;c00c1048&gt;] (=
free_contig_range+0xa0/0xb8)<br>[ =C2=A0 61.774677] =C2=A0r3:00000177 r2:c0=
80438c<br>[ =C2=A0 61.778612] =C2=A0r4:00000000<br>[ =C2=A0 61.781185] [&lt=
;c00c0fa8&gt;] (free_contig_range) from [&lt;c0101614&gt;] (cma_release+0x9=
4/0xbc)<br>[ =C2=A0 61.789483] =C2=A0r9:eeef9000 r8:f07a9000 r7:ee0fc610 r6=
:00000001 r5:c095e3c4 r4:000beb00<br>[ =C2=A0 61.797368] [&lt;c0101580&gt;]=
 (cma_release) from [&lt;c03fdc8c&gt;] (dma_release_from_contiguous+0x34/0x=
3c)<br>[ =C2=A0 61.806449] =C2=A0r5:008d0c00 r4:00177000<br>[ =C2=A0 61.810=
089] [&lt;c03fdc58&gt;] (dma_release_from_contiguous) from [&lt;c001af14&gt=
;] (__arm_dma_free+0x14c/0x1f8)<br>[ =C2=A0 61.819658] [&lt;c001adc8&gt;] (=
__arm_dma_free) from [&lt;c001b010&gt;] (arm_dma_free+0x24/0x2c)<br>[ =C2=
=A0 61.827466] =C2=A0r10:00000001 r9:c03c29f8 r8:ed02e080 r7:00000001 r6:ee=
206c00 r5:c001afec<br>[ =C2=A0 61.835624] =C2=A0r4:ed02e480<br>[ =C2=A0 61.=
838209] [&lt;c001afec&gt;] (arm_dma_free) from [&lt;c03de978&gt;] (drm_gem_=
cma_free_object+0x5c/0x98)<br>[ =C2=A0 61.847049] [&lt;c03de91c&gt;] (drm_g=
em_cma_free_object) from [&lt;c03c2780&gt;] (drm_gem_object_free+0x30/0x38)=
<br>[ =C2=A0 61.856255] =C2=A0r5:ee206c34 r4:ed02e480<br>[ =C2=A0 61.859872=
] [&lt;c03c2750&gt;] (drm_gem_object_free) from [&lt;c03c286c&gt;] (drm_gem=
_object_handle_unreference_unlocked+0xe4/0x114)<br>[ =C2=A0 61.871318] [&lt=
;c03c2788&gt;] (drm_gem_object_handle_unreference_unlocked) from [&lt;c03c2=
a50&gt;] (drm_gem_object_release_handle+0x58/0x70)<br>[ =C2=A0 61.883071] =
=C2=A0r5:ed02e080 r4:ed02e480<br>[ =C2=A0 61.886908] [&lt;c03c29f8&gt;] (dr=
m_gem_object_release_handle) from [&lt;c02d4bbc&gt;] (idr_for_each+0xac/0xe=
0)<br>[ =C2=A0 61.896256] =C2=A0r7:00000001 r6:000000ff r5:ec209d50 r4:0000=
0000<br>[ =C2=A0 61.901992] [&lt;c02d4b10&gt;] (idr_for_each) from [&lt;c03=
c3104&gt;] (drm_gem_release+0x20/0x30)<br>[ =C2=A0 61.910107] =C2=A0r10:ed0=
2e0dc r9:ee206c34 r8:ee206cc4 r7:ee206cc0 r6:ee206c00 r5:ed02e0e0<br>[ =C2=
=A0 61.918075] =C2=A0r4:ed02e0a0<br>[ =C2=A0 61.920651] [&lt;c03c30e4&gt;] =
(drm_gem_release) from [&lt;c03c1e50&gt;] (drm_release+0x378/0x518)<br>[ =
=C2=A0 61.928926] =C2=A0r5:ed02e0e0 r4:ed02e080<br>[ =C2=A0 61.932560] [&lt=
;c03c1ad8&gt;] (drm_release) from [&lt;c0104fbc&gt;] (__fput+0x88/0x20c)<br=
>[ =C2=A0 61.939897] =C2=A0r10:ed18bd88 r9:00000008 r8:ee293020 r7:00000000=
 r6:ee40d6d0 r5:ed812bb0<br>[ =C2=A0 61.947834] =C2=A0r4:ed18bd80<br>[ =C2=
=A0 61.950399] [&lt;c0104f34&gt;] (__fput) from [&lt;c0105198&gt;] (____fpu=
t+0x10/0x14)<br>[ =C2=A0 61.957430] =C2=A0r10:08430000 r9:ee6c43b4 r8:ee6c4=
380 r7:ed309a28 r6:c094330c r5:ed309680<br>[ =C2=A0 61.965394] =C2=A0r4:ed1=
8ba80<br>[ =C2=A0 61.967970] [&lt;c0105188&gt;] (____fput) from [&lt;c004df=
c0&gt;] (task_work_run+0x94/0xc4)<br>[ =C2=A0 61.975649] [&lt;c004df2c&gt;]=
 (task_work_run) from [&lt;c0037c94&gt;] (do_exit+0x2e0/0x9a8)<br>[ =C2=A0 =
61.983084] =C2=A0r7:00000001 r6:ec209edc r5:00000000 r4:ed309680<br>[ =C2=
=A0 61.988995] [&lt;c00379b4&gt;] (do_exit) from [&lt;c00383dc&gt;] (do_gro=
up_exit+0x44/0xf8)<br>[ =C2=A0 61.996493] =C2=A0r7:ee7179c0<br>[ =C2=A0 61.=
999071] [&lt;c0038398&gt;] (do_group_exit) from [&lt;c0042140&gt;] (get_sig=
nal+0x2e4/0x700)<br>[ =C2=A0 62.007052] =C2=A0r5:00418004 r4:00000009<br>[ =
=C2=A0 62.010686] [&lt;c0041e5c&gt;] (get_signal) from [&lt;c00122b0&gt;] (=
do_signal+0x6c/0x3cc)<br>[ =C2=A0 62.018606] =C2=A0r10:00000000 r9:ec208000=
 r8:fffffe00 r7:b5836b16 r6:ec209ec8 r5:b5836b14<br>[ =C2=A0 62.026535] =C2=
=A0r4:ec209fb0 r3:002a4c8c<br>[ =C2=A0 62.030149] [&lt;c0012244&gt;] (do_si=
gnal) from [&lt;c00127d4&gt;] (do_work_pending+0xa4/0xb4)<br>[ =C2=A0 62.03=
7996] =C2=A0r10:00000000 r9:ec208000 r8:c000fa24 r7:000000f0 r6:ec209fb0 r5=
:c000fa24<br>[ =C2=A0 62.045911] =C2=A0r4:ec208000<br>[ =C2=A0 62.048465] [=
&lt;c0012730&gt;] (do_work_pending) from [&lt;c000f8cc&gt;] (work_pending+0=
xc/0x20)<br>[ =C2=A0 62.056455] =C2=A0r7:000000f0 r6:0000000f r5:00000000 r=
4:002a4c88<br>[ =C2=A0 62.062161] ---[ end trace e8a7009dde5ddb7c ]---
<div><br></div><div><div class=3D"gmail_default"><font color=3D"#333399" fa=
ce=3D"georgia, serif">=E2=80=8B</font>thanks<br>Ankur</div></div></div>

--001a1141dca2759af8052b2c32fe--
