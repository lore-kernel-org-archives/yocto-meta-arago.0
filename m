Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by arago-project.org (Postfix) with ESMTPS id 51B3752A0B
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 20:43:40 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id 13-v6so11677818ois.1
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 13:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IShlpKJTqpivU1bSUmvHzlEQs+busk/MenHceXShlhY=;
	b=tkdjSiJasJKocCfsuECEeOLwkQIOWYxjohrc9LnsdbFD7ymc9JTWPIFV9kFBi2PWmN
	+QFlL3VKzZSedDh/dleNUemoLsC7JF05YE+uXP0vCJS3qvLTcBBnMlDFSrxyNsZT052o
	GhrR6JNUCF1vgXYamoBA+up6Pk6KUDpz4bVJPkcwo7lPYg6XIXuvpTY9hBNAEateQbXV
	fMWBvOmF5O0kdrBe8ghkNII6XPixgKSw2mdu2DOJ6FYAvDyWhSaieLzrBCdmZGsEbdqT
	AfjcrS6HlDtI3XHGcnoiJghE3sYFP+U0XclMrI/LS+G8laMGDyUuH8PDmjB6nfftQr/P
	z0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IShlpKJTqpivU1bSUmvHzlEQs+busk/MenHceXShlhY=;
	b=j5kQqk7wrw/gYCyhB6BXEwGEsgUel81UkIpOe9Uic8jIctRl5gbcuZyEyxOTNVJnzk
	mzAGvP32btuuMs/YhjBCyxWk5Irp2ErqrlUvXHklzRGUGROhV7GAu7BEaYCXbq259W6g
	3IY7hZzGd47BSutjS/+raAnYr3u0450MOhXOVFZZk1YraRIkVa95fCk2IcwuXTVu59ZM
	kGQRiOVqlCrdBB9V6/YFvRcTZPBqzE4qd0Ys2904uAiwsGQ+UWf9wc6zegWIYzZ5GyOo
	7I/hxQLniJtfuGYTds3oTQHm2goJF1FS0aUTWLZ4uAWJA5xqvyxSGYiVe3X4/a0W1v9h
	vrQg==
X-Gm-Message-State: APzg51CPuPMtgaUriaMYNX62oIeV4WwPQkywofcVk6SBrtNmWXUKsgns
	ABeZ7OAegZtYLPu74t97Dhk2sLhLrkTV7OX8bJw=
X-Google-Smtp-Source: ANB0VdbnWSB/MESjpHVPFvJP17t7cS9A9xJMUTDLaLnZoDM9/oEs4dyGZiiIfQsLDld4N//JUSYIMDa3/d/RLhhn290=
X-Received: by 2002:aca:b789:: with SMTP id
	h131-v6mr4491984oif.298.1535057012341; 
	Thu, 23 Aug 2018 13:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <CADySD0FvyGdDUJkAAO_exX=WahT_GtNhQazwvjpSCpqKZZ9Q7Q@mail.gmail.com>
	<CADySD0GO00Jnyf1x3OX8WA0JYNMEo1SkCeXmkV=Qhj58q-QUAg@mail.gmail.com>
	<20180823162103.GR29422@beryl>
In-Reply-To: <20180823162103.GR29422@beryl>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 24 Aug 2018 08:43:20 +1200
Message-ID: <CADySD0GzMELdVec1-WT11_xJRRLPzsim6J5UB7OYva6nJBiw5Q@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-arago@arago-project.org
Subject: Re: Crash when unloading pvrsrvkm in rocko branch for am335x-evm
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
X-List-Received-Date: Thu, 23 Aug 2018 20:43:40 -0000
Content-Type: multipart/alternative; boundary="000000000000ee42cb0574204f50"

--000000000000ee42cb0574204f50
Content-Type: text/plain; charset="UTF-8"

Ok, I will try  this.

Thanks
Ankur

On Fri 24 Aug, 2018, 4:21 AM Denys Dmytriyenko, <denys@ti.com> wrote:

> Does this help:
>
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=bcf0c0d3f7fa2a8964a6bf19ce4ce00e30e9a29f
>
>
> On Thu, Aug 23, 2018 at 11:05:23AM +1200, Ankur Tyagi wrote:
> > Ping
> >
> > Regards
> > Ankur
> >
> > On Tue 21 Aug, 2018, 9:44 PM Ankur Tyagi, <ankur.tyagi85@gmail.com>
> wrote:
> >
> > > Hi,
> > >
> > > I am using meta-arago rocko branch for am335x-evm.
> > >
> > > I am getting following crash during shutdown :
> > >
> > > [ 5674.656819] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x8 but
> > > found 0x0 (mask 0x8).
> > > [ 5674.665149] PVR_K:(Error): SGXPrePowerState: Wait for SGX ukernel
> power
> > > transition failed.
> > > [ 5674.673860] PVR_K: SGX debug (SGX_DDK sgxddk MAIN@3699939)
> > > [ 5674.679580] PVR_K:  Host Ctl flags= 00000006
> > > [ 5674.683872] PVR_K: SGX Host control:
> > > [ 5674.687670] PVR_K:   (HC-0) 0x00000001 0x00000000 0x00000000
> 0x00000001
> > >
> > > [ 5674.694233] PVR_K:   (HC-10) 0x00000000 0x00000000 0x0000000A
> 0x00030D40
> > >
> > > [ 5674.701143] PVR_K:   (HC-20) 0x00000000 0x00000004 0x00000006
> 0x00000000
> > >
> > > [ 5674.707939] PVR_K:   (HC-30) 0x00000000 0x00565EED 0xEEE815A0
> 0x00000000
> > >
> > > [ 5674.714590] PVR_K:   (HC-40) 0x00000000 0x00000000 0x00000002
> 0x00000000
> > >
> > > [ 5674.721417] PVR_K: SGX TA/3D control:
> > > [ 5674.725103] PVR_K:   (T3C-0) 0x0F003000 0x0F003140 0x0F002000
> 0x00000000
> > >
> > > [ 5674.731924] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002
> > > 0x00000000
> > > [ 5674.738786] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.745523] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.752487] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.759361] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.766098] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.773014] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.779875] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000
> > > 0x0F000000
> > > [ 5674.786613] PVR_K:   (T3C-90) 0x9B29A000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.793523] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.800435] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.807308] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.814046] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000
> > > 0x0F004000
> > > [ 5674.820953] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000
> > > 0x00000000
> > > [ 5674.827822] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.834559] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.841554] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.848551] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00000000
> > > 0x00000000
> > > [ 5674.855374] PVR_K: SGX Kernel CCB WO:0x2 RO:0x1
> > > [ 5674.860105] PVR_K: Active syncs
> > > [ 5674.863268] Unhandled fault: external abort on non-linefetch
> (0x1008)
> > > at 0xe0b20004
> > > [ 5674.870957] pgd = dc74c000
> > > [ 5674.873673] [e0b20004] *pgd=9c61a811, *pte=56000653, *ppte=56000453
> > > [ 5674.879987] Internal error: : 1008 [#1] PREEMPT ARM
> > > [ 5674.884884] Modules linked in: arc4 cryptodev(O) wl18xx wlcore
> mac80211
> > > cfg80211 musb_dsps musb_hdrc udc_core phy_am335x phy_am335x_control
> > > phy_generic usbcore usb_common pm33xx wkup_m3_ipc pvrsrvkm(O-)
> > > wkup_m3_rproc remoteproc omap_aes_driver crypto_engine omap_crypto
> > > omap_sham ti_emif_sram wlcore_sdio musb_am335x rtc_omap omap_wdt [last
> > > unloaded: bc_example]
> > > [ 5674.917006] CPU: 0 PID: 8566 Comm: rmmod Tainted: G           O
> > >  4.14.61-g7364914505 #3
> > > [ 5674.925217] Hardware name: Generic AM33XX (Flattened Device Tree)
> > > [ 5674.931335] task: dc251e00 task.stack: db65c000
> > > [ 5674.936216] PC is at PollForValueKM+0x14/0x114 [pvrsrvkm]
> > > [ 5674.941750] LR is at SGXPrePowerState.part.2+0x1d4/0x214 [pvrsrvkm]
> > > [ 5674.948044] pc : [<bf080120>]    lr : [<bf091130>]    psr: 60070013
> > > [ 5674.954335] sp : db65dcd8  ip : db65dd20  fp : db65dd1c
> > > [ 5674.959580] r10: 00000000  r9 : e0b20004  r8 : 00000000
> > > [ 5674.964826] r7 : 00000002  r6 : 00000000  r5 : dc753000  r4 :
> 00000000
> > > [ 5674.971379] r3 : 000f4240  r2 : ffffffff  r1 : 00000000  r0 :
> e0b20004
> > > [ 5674.977935] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> > >  Segment none
> > > [ 5674.985100] Control: 10c5387d  Table: 9c74c019  DAC: 00000051
> > > [ 5674.990870] Process rmmod (pid: 8566, stack limit = 0xdb65c208)
> > > [ 5674.996815] Stack: (0xdb65dcd8 to 0xdb65e000)
> > > [ 5675.001191] dcc0:
> > > bf07b484 bf07e134
> > > [ 5675.009409] dce0: db65dd1c db65dcf0 bf0900f8 bf07b430 00000000
> 00000000
> > > dc753000 00000000
> > > [ 5675.017626] dd00: 00000002 00000000 db65c000 00000000 db65dd74
> db65dd20
> > > bf091130 bf080118
> > > [ 5675.025843] dd20: 00000032 00000000 00000000 c0173920 00000000
> 00000000
> > > 00000000 00000001
> > > [ 5675.034059] dd40: 00000000 00000000 00000000 00000000 c0865198
> db5e7080
> > > 00000002 bf07e9a4
> > > [ 5675.042274] dd60: 00000000 dc0dfe44 db65dd84 db65dd78 bf091464
> bf090f68
> > > db65dd9c db65dd88
> > > [ 5675.050492] dd80: bf07ea00 bf091444 00000000 db65ddc8 db65ddc0
> db65dda0
> > > bf07e0b0 bf07e9b0
> > > [ 5675.058707] dda0: db65ddc4 db65ddc8 bf0c3f48 00000000 00000002
> db65ddf4
> > > db65ddd0 bf07ed04
> > > [ 5675.066925] ddc0: bf07e084 bf07e9a4 00000000 00000000 00000002
> db00ce00
> > > 00000000 00000000
> > > [ 5675.075141] dde0: db00ce00 bf0c3fa8 db65de24 db65ddf8 bf07ffac
> bf07ecd0
> > > db2a1440 00000000
> > > [ 5675.083357] de00: db65de24 bf0c3ee0 00000000 bf0a3200 dc0dfe10
> dc0dfe44
> > > db65de3c db65de28
> > > [ 5675.091574] de20: bf08855c bf07ff58 dc11d800 dc7e0400 db65de4c
> db65de40
> > > bf07425c bf0883d4
> > > [ 5675.099790] de40: db65de5c db65de50 bf095538 bf07424c db65de7c
> db65de60
> > > c04f1df4 bf095534
> > > [ 5675.108006] de60: dc11d800 dc7e0400 bf0a3200 dc0dfe10 db65de94
> db65de80
> > > bf09543c c04f1db8
> > > [ 5675.116222] de80: dc11d810 dc11d810 db65deac db65de98 c054e140
> bf095404
> > > dc11d810 dc11d844
> > > [ 5675.124439] dea0: db65ded4 db65deb0 c054ca84 c054e124 dc11d810
> ffffe000
> > > bf0a3200 00000081
> > > [ 5675.132656] dec0: c0107f04 db65c000 db65def4 db65ded8 c054cba8
> c054c930
> > > bf0a3200 0003bd44
> > > [ 5675.140872] dee0: 00000800 00000081 db65df0c db65def8 c054bc14
> c054cb4c
> > > bf0a3200 0003bd44
> > > [ 5675.149088] df00: db65df24 db65df10 c054d294 c054bbcc bf0a3440
> 0003bd44
> > > db65df34 db65df28
> > > [ 5675.157304] df20: c054e228 c054d270 db65df44 db65df38 bf09570c
> c054e220
> > > db65dfa4 db65df48
> > > [ 5675.165520] df40: c0197074 bf095704 db65df64 73727670 6d6b7672
> 00000000
> > > db65df8c db65df68
> > > [ 5675.173736] df60: c0144204 c0222324 ffffe000 c0107f04 ffffe000
> c0107f04
> > > db65dfb0 00000006
> > > [ 5675.181954] df80: db65dfac 0065df90 c010b474 00000002 beaabc28
> 00000000
> > > 00000000 db65dfa8
> > > [ 5675.190169] dfa0: c0107d20 c0196f34 00000002 beaabc28 0003bd44
> 00000800
> > > b6f15688 00002002
> > > [ 5675.198387] dfc0: 00000002 beaabc28 00000000 00000081 beaabf0c
> 0003bd08
> > > beaabe0c 00000001
> > > [ 5675.206604] dfe0: b6eed521 beaabbdc 0001f7f8 b6eed528 800b0030
> 0003bd44
> > > 00000000 00000000
> > > [ 5675.214813] Backtrace:
> > > [ 5675.217482] [<bf08010c>] (PollForValueKM [pvrsrvkm]) from
> [<bf091130>]
> > > (SGXPrePowerState.part.2+0x1d4/0x214 [pvrsrvkm])
> > > [ 5675.228319]  r10:00000000 r9:db65c000 r8:00000000 r7:00000002
> > > r6:00000000 r5:dc753000
> > > [ 5675.236180]  r4:00000000
> > > [ 5675.238917] [<bf090f5c>] (SGXPrePowerState.part.2 [pvrsrvkm]) from
> > > [<bf091464>] (SGXPrePowerState+0x2c/0x30 [pvrsrvkm])
> > > [ 5675.249749]  r8:dc0dfe44 r7:00000000 r6:bf07e9a4 r5:00000002
> r4:db5e7080
> > >
> > > [ 5675.256669] [<bf091438>] (SGXPrePowerState [pvrsrvkm]) from
> > > [<bf07ea00>] (PVRSRVDevicePrePowerStateKM_AnyVaCb+0x5c/0x80 [pvrsrvkm])
> > > [ 5675.268739] [<bf07e9a4>] (PVRSRVDevicePrePowerStateKM_AnyVaCb
> > > [pvrsrvkm]) from [<bf07e0b0>]
> > > (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x3c/0x5c [pvrsrvkm])
> > > [ 5675.282795]  r5:db65ddc8 r4:00000000
> > > [ 5675.286576] [<bf07e078>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va
> > > [pvrsrvkm]) from [<bf07ed04>] (PVRSRVSetDevicePowerStateKM+0x40/0xac
> > > [pvrsrvkm])
> > > [ 5675.299935]  r3:00000000 r2:00000000 r1:bf07e9a4
> > > [ 5675.304571]  r6:00000002 r5:00000000 r4:bf0c3f48
> > > [ 5675.309398] [<bf07ecc4>] (PVRSRVSetDevicePowerStateKM [pvrsrvkm])
> from
> > > [<bf07ffac>] (PVRSRVDeinitialiseDevice+0x60/0x1c0 [pvrsrvkm])
> > > [ 5675.321363]  r7:bf0c3fa8 r6:db00ce00 r5:00000000 r4:00000000
> > > [ 5675.327238] [<bf07ff4c>] (PVRSRVDeinitialiseDevice [pvrsrvkm]) from
> > > [<bf08855c>] (SysDeinitialise+0x194/0x260 [pvrsrvkm])
> > > [ 5675.338245]  r8:dc0dfe44 r7:dc0dfe10 r6:bf0a3200 r5:00000000
> r4:bf0c3ee0
> > >
> > > [ 5675.345162] [<bf0883c8>] (SysDeinitialise [pvrsrvkm]) from
> [<bf07425c>]
> > > (PVRCore_Cleanup+0x1c/0x34 [pvrsrvkm])
> > > [ 5675.355205]  r5:dc7e0400 r4:dc11d800
> > > [ 5675.358981] [<bf074240>] (PVRCore_Cleanup [pvrsrvkm]) from
> [<bf095538>]
> > > (PVRSRVDrmUnload+0x10/0x14 [pvrsrvkm])
> > > [ 5675.369141] [<bf095528>] (PVRSRVDrmUnload [pvrsrvkm]) from
> [<c04f1df4>]
> > > (drm_dev_unregister+0x48/0xe8)
> > > [ 5675.378587] [<c04f1dac>] (drm_dev_unregister) from [<bf09543c>]
> > > (PVRSRVDrmRemove+0x44/0x68 [pvrsrvkm])
> > > [ 5675.387936]  r7:dc0dfe10 r6:bf0a3200 r5:dc7e0400 r4:dc11d800
> > > [ 5675.393726] [<bf0953f8>] (PVRSRVDrmRemove [pvrsrvkm]) from
> [<c054e140>]
> > > (platform_drv_remove+0x28/0x48)
> > > [ 5675.403160]  r5:dc11d810 r4:dc11d810
> > > [ 5675.406756] [<c054e118>] (platform_drv_remove) from [<c054ca84>]
> > > (device_release_driver_internal+0x160/0x200)
> > > [ 5675.416712]  r5:dc11d844 r4:dc11d810
> > > [ 5675.420306] [<c054c924>] (device_release_driver_internal) from
> > > [<c054cba8>] (driver_detach+0x68/0xcc)
> > > [ 5675.429569]  r9:db65c000 r8:c0107f04 r7:00000081 r6:bf0a3200
> > > r5:ffffe000 r4:dc11d810
> > > [ 5675.437349] [<c054cb40>] (driver_detach) from [<c054bc14>]
> > > (bus_remove_driver+0x54/0xa8)
> > > [ 5675.445475]  r7:00000081 r6:00000800 r5:0003bd44 r4:bf0a3200
> > > [ 5675.451160] [<c054bbc0>] (bus_remove_driver) from [<c054d294>]
> > > (driver_unregister+0x30/0x50)
> > > [ 5675.459634]  r5:0003bd44 r4:bf0a3200
> > > [ 5675.463228] [<c054d264>] (driver_unregister) from [<c054e228>]
> > > (platform_driver_unregister+0x14/0x18)
> > > [ 5675.472486]  r5:0003bd44 r4:bf0a3440
> > > [ 5675.476175] [<c054e214>] (platform_driver_unregister) from
> [<bf09570c>]
> > > (PVRSRVDrmExit+0x14/0x908 [pvrsrvkm])
> > > [ 5675.486242] [<bf0956f8>] (PVRSRVDrmExit [pvrsrvkm]) from
> [<c0197074>]
> > > (SyS_delete_module+0x14c/0x1d0)
> > > [ 5675.495517] [<c0196f28>] (SyS_delete_module) from [<c0107d20>]
> > > (ret_fast_syscall+0x0/0x54)
> > > [ 5675.503818]  r6:00000000 r5:beaabc28 r4:00000002
> > > [ 5675.508461] Code: e92ddff0 e24cb004 e24dd01c e1a09000 (e5904000)
> > > [ 5675.514586] ---[ end trace f0152b7ee610e9b6 ]---
> > > /etc/rc0.d/K08rc.pvr: line 75:  8566 Segmentation fault      rmmod
> pvrsrvkm
> > >
> > >
> > > How to resolve this error ?
> > >
> > > thanks
> > > Ankur
> > >
>
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>

--000000000000ee42cb0574204f50
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok, I will try=C2=A0 this.<div dir=3D"auto"><br></div><di=
v dir=3D"auto">Thanks</div><div dir=3D"auto">Ankur</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr">On Fri 24 Aug, 2018, 4:21 AM Denys Dmytr=
iyenko, &lt;<a href=3D"mailto:denys@ti.com">denys@ti.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">Does this help:<br>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=3Db=
cf0c0d3f7fa2a8964a6bf19ce4ce00e30e9a29f" rel=3D"noreferrer noreferrer" targ=
et=3D"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=
=3Dbcf0c0d3f7fa2a8964a6bf19ce4ce00e30e9a29f</a><br>
<br>
<br>
On Thu, Aug 23, 2018 at 11:05:23AM +1200, Ankur Tyagi wrote:<br>
&gt; Ping<br>
&gt; <br>
&gt; Regards<br>
&gt; Ankur<br>
&gt; <br>
&gt; On Tue 21 Aug, 2018, 9:44 PM Ankur Tyagi, &lt;<a href=3D"mailto:ankur.=
tyagi85@gmail.com" target=3D"_blank" rel=3D"noreferrer">ankur.tyagi85@gmail=
.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; Hi,<br>
&gt; &gt;<br>
&gt; &gt; I am using meta-arago rocko branch for am335x-evm.<br>
&gt; &gt;<br>
&gt; &gt; I am getting following crash during shutdown :<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.656819] PVR_K:(Error): PollForValueKM: Timeout. Expected 0=
x8 but<br>
&gt; &gt; found 0x0 (mask 0x8).<br>
&gt; &gt; [ 5674.665149] PVR_K:(Error): SGXPrePowerState: Wait for SGX uker=
nel power<br>
&gt; &gt; transition failed.<br>
&gt; &gt; [ 5674.673860] PVR_K: SGX debug (SGX_DDK sgxddk MAIN@3699939)<br>
&gt; &gt; [ 5674.679580] PVR_K:=C2=A0 Host Ctl flags=3D 00000006<br>
&gt; &gt; [ 5674.683872] PVR_K: SGX Host control:<br>
&gt; &gt; [ 5674.687670] PVR_K:=C2=A0 =C2=A0(HC-0) 0x00000001 0x00000000 0x=
00000000 0x00000001<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.694233] PVR_K:=C2=A0 =C2=A0(HC-10) 0x00000000 0x00000000 0=
x0000000A 0x00030D40<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.701143] PVR_K:=C2=A0 =C2=A0(HC-20) 0x00000000 0x00000004 0=
x00000006 0x00000000<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.707939] PVR_K:=C2=A0 =C2=A0(HC-30) 0x00000000 0x00565EED 0=
xEEE815A0 0x00000000<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.714590] PVR_K:=C2=A0 =C2=A0(HC-40) 0x00000000 0x00000000 0=
x00000002 0x00000000<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.721417] PVR_K: SGX TA/3D control:<br>
&gt; &gt; [ 5674.725103] PVR_K:=C2=A0 =C2=A0(T3C-0) 0x0F003000 0x0F003140 0=
x0F002000 0x00000000<br>
&gt; &gt;<br>
&gt; &gt; [ 5674.731924] PVR_K:=C2=A0 =C2=A0(T3C-10) 0x00000000 0x00000000 =
0x00000002<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.738786] PVR_K:=C2=A0 =C2=A0(T3C-20) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.745523] PVR_K:=C2=A0 =C2=A0(T3C-30) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.752487] PVR_K:=C2=A0 =C2=A0(T3C-40) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.759361] PVR_K:=C2=A0 =C2=A0(T3C-50) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.766098] PVR_K:=C2=A0 =C2=A0(T3C-60) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.773014] PVR_K:=C2=A0 =C2=A0(T3C-70) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.779875] PVR_K:=C2=A0 =C2=A0(T3C-80) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x0F000000<br>
&gt; &gt; [ 5674.786613] PVR_K:=C2=A0 =C2=A0(T3C-90) 0x9B29A000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.793523] PVR_K:=C2=A0 =C2=A0(T3C-A0) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.800435] PVR_K:=C2=A0 =C2=A0(T3C-B0) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.807308] PVR_K:=C2=A0 =C2=A0(T3C-C0) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.814046] PVR_K:=C2=A0 =C2=A0(T3C-D0) 0x0F000000 0x8000B000 =
0x8004B000<br>
&gt; &gt; 0x0F004000<br>
&gt; &gt; [ 5674.820953] PVR_K:=C2=A0 =C2=A0(T3C-E0) 0x0F00A420 0x0F00A740 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.827822] PVR_K:=C2=A0 =C2=A0(T3C-F0) 0x00000000 0x00000000 =
0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.834559] PVR_K:=C2=A0 =C2=A0(T3C-100) 0x00000000 0x00000000=
 0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.841554] PVR_K:=C2=A0 =C2=A0(T3C-110) 0x00000000 0x00000000=
 0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.848551] PVR_K:=C2=A0 =C2=A0(T3C-120) 0x00000000 0x00000000=
 0x00000000<br>
&gt; &gt; 0x00000000<br>
&gt; &gt; [ 5674.855374] PVR_K: SGX Kernel CCB WO:0x2 RO:0x1<br>
&gt; &gt; [ 5674.860105] PVR_K: Active syncs<br>
&gt; &gt; [ 5674.863268] Unhandled fault: external abort on non-linefetch (=
0x1008)<br>
&gt; &gt; at 0xe0b20004<br>
&gt; &gt; [ 5674.870957] pgd =3D dc74c000<br>
&gt; &gt; [ 5674.873673] [e0b20004] *pgd=3D9c61a811, *pte=3D56000653, *ppte=
=3D56000453<br>
&gt; &gt; [ 5674.879987] Internal error: : 1008 [#1] PREEMPT ARM<br>
&gt; &gt; [ 5674.884884] Modules linked in: arc4 cryptodev(O) wl18xx wlcore=
 mac80211<br>
&gt; &gt; cfg80211 musb_dsps musb_hdrc udc_core phy_am335x phy_am335x_contr=
ol<br>
&gt; &gt; phy_generic usbcore usb_common pm33xx wkup_m3_ipc pvrsrvkm(O-)<br=
>
&gt; &gt; wkup_m3_rproc remoteproc omap_aes_driver crypto_engine omap_crypt=
o<br>
&gt; &gt; omap_sham ti_emif_sram wlcore_sdio musb_am335x rtc_omap omap_wdt =
[last<br>
&gt; &gt; unloaded: bc_example]<br>
&gt; &gt; [ 5674.917006] CPU: 0 PID: 8566 Comm: rmmod Tainted: G=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O<br>
&gt; &gt;=C2=A0 4.14.61-g7364914505 #3<br>
&gt; &gt; [ 5674.925217] Hardware name: Generic AM33XX (Flattened Device Tr=
ee)<br>
&gt; &gt; [ 5674.931335] task: dc251e00 task.stack: db65c000<br>
&gt; &gt; [ 5674.936216] PC is at PollForValueKM+0x14/0x114 [pvrsrvkm]<br>
&gt; &gt; [ 5674.941750] LR is at SGXPrePowerState.part.2+0x1d4/0x214 [pvrs=
rvkm]<br>
&gt; &gt; [ 5674.948044] pc : [&lt;bf080120&gt;]=C2=A0 =C2=A0 lr : [&lt;bf0=
91130&gt;]=C2=A0 =C2=A0 psr: 60070013<br>
&gt; &gt; [ 5674.954335] sp : db65dcd8=C2=A0 ip : db65dd20=C2=A0 fp : db65d=
d1c<br>
&gt; &gt; [ 5674.959580] r10: 00000000=C2=A0 r9 : e0b20004=C2=A0 r8 : 00000=
000<br>
&gt; &gt; [ 5674.964826] r7 : 00000002=C2=A0 r6 : 00000000=C2=A0 r5 : dc753=
000=C2=A0 r4 : 00000000<br>
&gt; &gt; [ 5674.971379] r3 : 000f4240=C2=A0 r2 : ffffffff=C2=A0 r1 : 00000=
000=C2=A0 r0 : e0b20004<br>
&gt; &gt; [ 5674.977935] Flags: nZCv=C2=A0 IRQs on=C2=A0 FIQs on=C2=A0 Mode=
 SVC_32=C2=A0 ISA ARM<br>
&gt; &gt;=C2=A0 Segment none<br>
&gt; &gt; [ 5674.985100] Control: 10c5387d=C2=A0 Table: 9c74c019=C2=A0 DAC:=
 00000051<br>
&gt; &gt; [ 5674.990870] Process rmmod (pid: 8566, stack limit =3D 0xdb65c2=
08)<br>
&gt; &gt; [ 5674.996815] Stack: (0xdb65dcd8 to 0xdb65e000)<br>
&gt; &gt; [ 5675.001191] dcc0:<br>
&gt; &gt; bf07b484 bf07e134<br>
&gt; &gt; [ 5675.009409] dce0: db65dd1c db65dcf0 bf0900f8 bf07b430 00000000=
 00000000<br>
&gt; &gt; dc753000 00000000<br>
&gt; &gt; [ 5675.017626] dd00: 00000002 00000000 db65c000 00000000 db65dd74=
 db65dd20<br>
&gt; &gt; bf091130 bf080118<br>
&gt; &gt; [ 5675.025843] dd20: 00000032 00000000 00000000 c0173920 00000000=
 00000000<br>
&gt; &gt; 00000000 00000001<br>
&gt; &gt; [ 5675.034059] dd40: 00000000 00000000 00000000 00000000 c0865198=
 db5e7080<br>
&gt; &gt; 00000002 bf07e9a4<br>
&gt; &gt; [ 5675.042274] dd60: 00000000 dc0dfe44 db65dd84 db65dd78 bf091464=
 bf090f68<br>
&gt; &gt; db65dd9c db65dd88<br>
&gt; &gt; [ 5675.050492] dd80: bf07ea00 bf091444 00000000 db65ddc8 db65ddc0=
 db65dda0<br>
&gt; &gt; bf07e0b0 bf07e9b0<br>
&gt; &gt; [ 5675.058707] dda0: db65ddc4 db65ddc8 bf0c3f48 00000000 00000002=
 db65ddf4<br>
&gt; &gt; db65ddd0 bf07ed04<br>
&gt; &gt; [ 5675.066925] ddc0: bf07e084 bf07e9a4 00000000 00000000 00000002=
 db00ce00<br>
&gt; &gt; 00000000 00000000<br>
&gt; &gt; [ 5675.075141] dde0: db00ce00 bf0c3fa8 db65de24 db65ddf8 bf07ffac=
 bf07ecd0<br>
&gt; &gt; db2a1440 00000000<br>
&gt; &gt; [ 5675.083357] de00: db65de24 bf0c3ee0 00000000 bf0a3200 dc0dfe10=
 dc0dfe44<br>
&gt; &gt; db65de3c db65de28<br>
&gt; &gt; [ 5675.091574] de20: bf08855c bf07ff58 dc11d800 dc7e0400 db65de4c=
 db65de40<br>
&gt; &gt; bf07425c bf0883d4<br>
&gt; &gt; [ 5675.099790] de40: db65de5c db65de50 bf095538 bf07424c db65de7c=
 db65de60<br>
&gt; &gt; c04f1df4 bf095534<br>
&gt; &gt; [ 5675.108006] de60: dc11d800 dc7e0400 bf0a3200 dc0dfe10 db65de94=
 db65de80<br>
&gt; &gt; bf09543c c04f1db8<br>
&gt; &gt; [ 5675.116222] de80: dc11d810 dc11d810 db65deac db65de98 c054e140=
 bf095404<br>
&gt; &gt; dc11d810 dc11d844<br>
&gt; &gt; [ 5675.124439] dea0: db65ded4 db65deb0 c054ca84 c054e124 dc11d810=
 ffffe000<br>
&gt; &gt; bf0a3200 00000081<br>
&gt; &gt; [ 5675.132656] dec0: c0107f04 db65c000 db65def4 db65ded8 c054cba8=
 c054c930<br>
&gt; &gt; bf0a3200 0003bd44<br>
&gt; &gt; [ 5675.140872] dee0: 00000800 00000081 db65df0c db65def8 c054bc14=
 c054cb4c<br>
&gt; &gt; bf0a3200 0003bd44<br>
&gt; &gt; [ 5675.149088] df00: db65df24 db65df10 c054d294 c054bbcc bf0a3440=
 0003bd44<br>
&gt; &gt; db65df34 db65df28<br>
&gt; &gt; [ 5675.157304] df20: c054e228 c054d270 db65df44 db65df38 bf09570c=
 c054e220<br>
&gt; &gt; db65dfa4 db65df48<br>
&gt; &gt; [ 5675.165520] df40: c0197074 bf095704 db65df64 73727670 6d6b7672=
 00000000<br>
&gt; &gt; db65df8c db65df68<br>
&gt; &gt; [ 5675.173736] df60: c0144204 c0222324 ffffe000 c0107f04 ffffe000=
 c0107f04<br>
&gt; &gt; db65dfb0 00000006<br>
&gt; &gt; [ 5675.181954] df80: db65dfac 0065df90 c010b474 00000002 beaabc28=
 00000000<br>
&gt; &gt; 00000000 db65dfa8<br>
&gt; &gt; [ 5675.190169] dfa0: c0107d20 c0196f34 00000002 beaabc28 0003bd44=
 00000800<br>
&gt; &gt; b6f15688 00002002<br>
&gt; &gt; [ 5675.198387] dfc0: 00000002 beaabc28 00000000 00000081 beaabf0c=
 0003bd08<br>
&gt; &gt; beaabe0c 00000001<br>
&gt; &gt; [ 5675.206604] dfe0: b6eed521 beaabbdc 0001f7f8 b6eed528 800b0030=
 0003bd44<br>
&gt; &gt; 00000000 00000000<br>
&gt; &gt; [ 5675.214813] Backtrace:<br>
&gt; &gt; [ 5675.217482] [&lt;bf08010c&gt;] (PollForValueKM [pvrsrvkm]) fro=
m [&lt;bf091130&gt;]<br>
&gt; &gt; (SGXPrePowerState.part.2+0x1d4/0x214 [pvrsrvkm])<br>
&gt; &gt; [ 5675.228319]=C2=A0 r10:00000000 r9:db65c000 r8:00000000 r7:0000=
0002<br>
&gt; &gt; r6:00000000 r5:dc753000<br>
&gt; &gt; [ 5675.236180]=C2=A0 r4:00000000<br>
&gt; &gt; [ 5675.238917] [&lt;bf090f5c&gt;] (SGXPrePowerState.part.2 [pvrsr=
vkm]) from<br>
&gt; &gt; [&lt;bf091464&gt;] (SGXPrePowerState+0x2c/0x30 [pvrsrvkm])<br>
&gt; &gt; [ 5675.249749]=C2=A0 r8:dc0dfe44 r7:00000000 r6:bf07e9a4 r5:00000=
002 r4:db5e7080<br>
&gt; &gt;<br>
&gt; &gt; [ 5675.256669] [&lt;bf091438&gt;] (SGXPrePowerState [pvrsrvkm]) f=
rom<br>
&gt; &gt; [&lt;bf07ea00&gt;] (PVRSRVDevicePrePowerStateKM_AnyVaCb+0x5c/0x80=
 [pvrsrvkm])<br>
&gt; &gt; [ 5675.268739] [&lt;bf07e9a4&gt;] (PVRSRVDevicePrePowerStateKM_An=
yVaCb<br>
&gt; &gt; [pvrsrvkm]) from [&lt;bf07e0b0&gt;]<br>
&gt; &gt; (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x3c/0x5c [pvrsrvkm])<=
br>
&gt; &gt; [ 5675.282795]=C2=A0 r5:db65ddc8 r4:00000000<br>
&gt; &gt; [ 5675.286576] [&lt;bf07e078&gt;] (List_PVRSRV_POWER_DEV_PVRSRV_E=
RROR_Any_va<br>
&gt; &gt; [pvrsrvkm]) from [&lt;bf07ed04&gt;] (PVRSRVSetDevicePowerStateKM+=
0x40/0xac<br>
&gt; &gt; [pvrsrvkm])<br>
&gt; &gt; [ 5675.299935]=C2=A0 r3:00000000 r2:00000000 r1:bf07e9a4<br>
&gt; &gt; [ 5675.304571]=C2=A0 r6:00000002 r5:00000000 r4:bf0c3f48<br>
&gt; &gt; [ 5675.309398] [&lt;bf07ecc4&gt;] (PVRSRVSetDevicePowerStateKM [p=
vrsrvkm]) from<br>
&gt; &gt; [&lt;bf07ffac&gt;] (PVRSRVDeinitialiseDevice+0x60/0x1c0 [pvrsrvkm=
])<br>
&gt; &gt; [ 5675.321363]=C2=A0 r7:bf0c3fa8 r6:db00ce00 r5:00000000 r4:00000=
000<br>
&gt; &gt; [ 5675.327238] [&lt;bf07ff4c&gt;] (PVRSRVDeinitialiseDevice [pvrs=
rvkm]) from<br>
&gt; &gt; [&lt;bf08855c&gt;] (SysDeinitialise+0x194/0x260 [pvrsrvkm])<br>
&gt; &gt; [ 5675.338245]=C2=A0 r8:dc0dfe44 r7:dc0dfe10 r6:bf0a3200 r5:00000=
000 r4:bf0c3ee0<br>
&gt; &gt;<br>
&gt; &gt; [ 5675.345162] [&lt;bf0883c8&gt;] (SysDeinitialise [pvrsrvkm]) fr=
om [&lt;bf07425c&gt;]<br>
&gt; &gt; (PVRCore_Cleanup+0x1c/0x34 [pvrsrvkm])<br>
&gt; &gt; [ 5675.355205]=C2=A0 r5:dc7e0400 r4:dc11d800<br>
&gt; &gt; [ 5675.358981] [&lt;bf074240&gt;] (PVRCore_Cleanup [pvrsrvkm]) fr=
om [&lt;bf095538&gt;]<br>
&gt; &gt; (PVRSRVDrmUnload+0x10/0x14 [pvrsrvkm])<br>
&gt; &gt; [ 5675.369141] [&lt;bf095528&gt;] (PVRSRVDrmUnload [pvrsrvkm]) fr=
om [&lt;c04f1df4&gt;]<br>
&gt; &gt; (drm_dev_unregister+0x48/0xe8)<br>
&gt; &gt; [ 5675.378587] [&lt;c04f1dac&gt;] (drm_dev_unregister) from [&lt;=
bf09543c&gt;]<br>
&gt; &gt; (PVRSRVDrmRemove+0x44/0x68 [pvrsrvkm])<br>
&gt; &gt; [ 5675.387936]=C2=A0 r7:dc0dfe10 r6:bf0a3200 r5:dc7e0400 r4:dc11d=
800<br>
&gt; &gt; [ 5675.393726] [&lt;bf0953f8&gt;] (PVRSRVDrmRemove [pvrsrvkm]) fr=
om [&lt;c054e140&gt;]<br>
&gt; &gt; (platform_drv_remove+0x28/0x48)<br>
&gt; &gt; [ 5675.403160]=C2=A0 r5:dc11d810 r4:dc11d810<br>
&gt; &gt; [ 5675.406756] [&lt;c054e118&gt;] (platform_drv_remove) from [&lt=
;c054ca84&gt;]<br>
&gt; &gt; (device_release_driver_internal+0x160/0x200)<br>
&gt; &gt; [ 5675.416712]=C2=A0 r5:dc11d844 r4:dc11d810<br>
&gt; &gt; [ 5675.420306] [&lt;c054c924&gt;] (device_release_driver_internal=
) from<br>
&gt; &gt; [&lt;c054cba8&gt;] (driver_detach+0x68/0xcc)<br>
&gt; &gt; [ 5675.429569]=C2=A0 r9:db65c000 r8:c0107f04 r7:00000081 r6:bf0a3=
200<br>
&gt; &gt; r5:ffffe000 r4:dc11d810<br>
&gt; &gt; [ 5675.437349] [&lt;c054cb40&gt;] (driver_detach) from [&lt;c054b=
c14&gt;]<br>
&gt; &gt; (bus_remove_driver+0x54/0xa8)<br>
&gt; &gt; [ 5675.445475]=C2=A0 r7:00000081 r6:00000800 r5:0003bd44 r4:bf0a3=
200<br>
&gt; &gt; [ 5675.451160] [&lt;c054bbc0&gt;] (bus_remove_driver) from [&lt;c=
054d294&gt;]<br>
&gt; &gt; (driver_unregister+0x30/0x50)<br>
&gt; &gt; [ 5675.459634]=C2=A0 r5:0003bd44 r4:bf0a3200<br>
&gt; &gt; [ 5675.463228] [&lt;c054d264&gt;] (driver_unregister) from [&lt;c=
054e228&gt;]<br>
&gt; &gt; (platform_driver_unregister+0x14/0x18)<br>
&gt; &gt; [ 5675.472486]=C2=A0 r5:0003bd44 r4:bf0a3440<br>
&gt; &gt; [ 5675.476175] [&lt;c054e214&gt;] (platform_driver_unregister) fr=
om [&lt;bf09570c&gt;]<br>
&gt; &gt; (PVRSRVDrmExit+0x14/0x908 [pvrsrvkm])<br>
&gt; &gt; [ 5675.486242] [&lt;bf0956f8&gt;] (PVRSRVDrmExit [pvrsrvkm]) from=
 [&lt;c0197074&gt;]<br>
&gt; &gt; (SyS_delete_module+0x14c/0x1d0)<br>
&gt; &gt; [ 5675.495517] [&lt;c0196f28&gt;] (SyS_delete_module) from [&lt;c=
0107d20&gt;]<br>
&gt; &gt; (ret_fast_syscall+0x0/0x54)<br>
&gt; &gt; [ 5675.503818]=C2=A0 r6:00000000 r5:beaabc28 r4:00000002<br>
&gt; &gt; [ 5675.508461] Code: e92ddff0 e24cb004 e24dd01c e1a09000 (e590400=
0)<br>
&gt; &gt; [ 5675.514586] ---[ end trace f0152b7ee610e9b6 ]---<br>
&gt; &gt; /etc/rc0.d/K08rc.pvr: line 75:=C2=A0 8566 Segmentation fault=C2=
=A0 =C2=A0 =C2=A0 rmmod pvrsrvkm<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; How to resolve this error ?<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; Ankur<br>
&gt; &gt;<br>
<br>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; <a href=3D"mailto:meta-arago@arago-project.org" target=3D"_blank" rel=
=3D"noreferrer">meta-arago@arago-project.org</a><br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o" rel=3D"noreferrer noreferrer" target=3D"_blank">http://arago-project.org=
/cgi-bin/mailman/listinfo/meta-arago</a><br>
<br>
</blockquote></div>

--000000000000ee42cb0574204f50--
