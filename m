Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 569A252A0B
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 16:22:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NGLwbE025467;
	Thu, 23 Aug 2018 11:21:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535041318;
	bh=t4tGd0yzDT0XkwfiBTGRnVHqqHWE94lXMpyi/j2sB2I=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Lls8m3mZLO1LuVmHjCCkvAvec7HoWW1FtvddbLilYqdl2lzsO0H6NcccuigMZPmNN
	sPKpazlzeF0frl32JqRD6N4yjxoD72dGpKG7uxPTovg5STGsdHMITs9jryqgh+kcA1
	3DW406niTtqQ98rt94rKNyht91HNhVmIXthlHtdo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NGLwIc003954;
	Thu, 23 Aug 2018 11:21:58 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 11:21:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 11:21:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NGLv8W002199;
	Thu, 23 Aug 2018 11:21:57 -0500
Date: Thu, 23 Aug 2018 12:21:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20180823162103.GR29422@beryl>
References: <CADySD0FvyGdDUJkAAO_exX=WahT_GtNhQazwvjpSCpqKZZ9Q7Q@mail.gmail.com>
	<CADySD0GO00Jnyf1x3OX8WA0JYNMEo1SkCeXmkV=Qhj58q-QUAg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GO00Jnyf1x3OX8WA0JYNMEo1SkCeXmkV=Qhj58q-QUAg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
X-List-Received-Date: Thu, 23 Aug 2018 16:22:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Does this help:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=bcf0c0d3f7fa2a8964a6bf19ce4ce00e30e9a29f


On Thu, Aug 23, 2018 at 11:05:23AM +1200, Ankur Tyagi wrote:
> Ping
> 
> Regards
> Ankur
> 
> On Tue 21 Aug, 2018, 9:44 PM Ankur Tyagi, <ankur.tyagi85@gmail.com> wrote:
> 
> > Hi,
> >
> > I am using meta-arago rocko branch for am335x-evm.
> >
> > I am getting following crash during shutdown :
> >
> > [ 5674.656819] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x8 but
> > found 0x0 (mask 0x8).
> > [ 5674.665149] PVR_K:(Error): SGXPrePowerState: Wait for SGX ukernel power
> > transition failed.
> > [ 5674.673860] PVR_K: SGX debug (SGX_DDK sgxddk MAIN@3699939)
> > [ 5674.679580] PVR_K:  Host Ctl flags= 00000006
> > [ 5674.683872] PVR_K: SGX Host control:
> > [ 5674.687670] PVR_K:   (HC-0) 0x00000001 0x00000000 0x00000000 0x00000001
> >
> > [ 5674.694233] PVR_K:   (HC-10) 0x00000000 0x00000000 0x0000000A 0x00030D40
> >
> > [ 5674.701143] PVR_K:   (HC-20) 0x00000000 0x00000004 0x00000006 0x00000000
> >
> > [ 5674.707939] PVR_K:   (HC-30) 0x00000000 0x00565EED 0xEEE815A0 0x00000000
> >
> > [ 5674.714590] PVR_K:   (HC-40) 0x00000000 0x00000000 0x00000002 0x00000000
> >
> > [ 5674.721417] PVR_K: SGX TA/3D control:
> > [ 5674.725103] PVR_K:   (T3C-0) 0x0F003000 0x0F003140 0x0F002000 0x00000000
> >
> > [ 5674.731924] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002
> > 0x00000000
> > [ 5674.738786] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.745523] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.752487] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.759361] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.766098] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.773014] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.779875] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000
> > 0x0F000000
> > [ 5674.786613] PVR_K:   (T3C-90) 0x9B29A000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.793523] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.800435] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.807308] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.814046] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000
> > 0x0F004000
> > [ 5674.820953] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000
> > 0x00000000
> > [ 5674.827822] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.834559] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.841554] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.848551] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00000000
> > 0x00000000
> > [ 5674.855374] PVR_K: SGX Kernel CCB WO:0x2 RO:0x1
> > [ 5674.860105] PVR_K: Active syncs
> > [ 5674.863268] Unhandled fault: external abort on non-linefetch (0x1008)
> > at 0xe0b20004
> > [ 5674.870957] pgd = dc74c000
> > [ 5674.873673] [e0b20004] *pgd=9c61a811, *pte=56000653, *ppte=56000453
> > [ 5674.879987] Internal error: : 1008 [#1] PREEMPT ARM
> > [ 5674.884884] Modules linked in: arc4 cryptodev(O) wl18xx wlcore mac80211
> > cfg80211 musb_dsps musb_hdrc udc_core phy_am335x phy_am335x_control
> > phy_generic usbcore usb_common pm33xx wkup_m3_ipc pvrsrvkm(O-)
> > wkup_m3_rproc remoteproc omap_aes_driver crypto_engine omap_crypto
> > omap_sham ti_emif_sram wlcore_sdio musb_am335x rtc_omap omap_wdt [last
> > unloaded: bc_example]
> > [ 5674.917006] CPU: 0 PID: 8566 Comm: rmmod Tainted: G           O
> >  4.14.61-g7364914505 #3
> > [ 5674.925217] Hardware name: Generic AM33XX (Flattened Device Tree)
> > [ 5674.931335] task: dc251e00 task.stack: db65c000
> > [ 5674.936216] PC is at PollForValueKM+0x14/0x114 [pvrsrvkm]
> > [ 5674.941750] LR is at SGXPrePowerState.part.2+0x1d4/0x214 [pvrsrvkm]
> > [ 5674.948044] pc : [<bf080120>]    lr : [<bf091130>]    psr: 60070013
> > [ 5674.954335] sp : db65dcd8  ip : db65dd20  fp : db65dd1c
> > [ 5674.959580] r10: 00000000  r9 : e0b20004  r8 : 00000000
> > [ 5674.964826] r7 : 00000002  r6 : 00000000  r5 : dc753000  r4 : 00000000
> > [ 5674.971379] r3 : 000f4240  r2 : ffffffff  r1 : 00000000  r0 : e0b20004
> > [ 5674.977935] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM
> >  Segment none
> > [ 5674.985100] Control: 10c5387d  Table: 9c74c019  DAC: 00000051
> > [ 5674.990870] Process rmmod (pid: 8566, stack limit = 0xdb65c208)
> > [ 5674.996815] Stack: (0xdb65dcd8 to 0xdb65e000)
> > [ 5675.001191] dcc0:
> > bf07b484 bf07e134
> > [ 5675.009409] dce0: db65dd1c db65dcf0 bf0900f8 bf07b430 00000000 00000000
> > dc753000 00000000
> > [ 5675.017626] dd00: 00000002 00000000 db65c000 00000000 db65dd74 db65dd20
> > bf091130 bf080118
> > [ 5675.025843] dd20: 00000032 00000000 00000000 c0173920 00000000 00000000
> > 00000000 00000001
> > [ 5675.034059] dd40: 00000000 00000000 00000000 00000000 c0865198 db5e7080
> > 00000002 bf07e9a4
> > [ 5675.042274] dd60: 00000000 dc0dfe44 db65dd84 db65dd78 bf091464 bf090f68
> > db65dd9c db65dd88
> > [ 5675.050492] dd80: bf07ea00 bf091444 00000000 db65ddc8 db65ddc0 db65dda0
> > bf07e0b0 bf07e9b0
> > [ 5675.058707] dda0: db65ddc4 db65ddc8 bf0c3f48 00000000 00000002 db65ddf4
> > db65ddd0 bf07ed04
> > [ 5675.066925] ddc0: bf07e084 bf07e9a4 00000000 00000000 00000002 db00ce00
> > 00000000 00000000
> > [ 5675.075141] dde0: db00ce00 bf0c3fa8 db65de24 db65ddf8 bf07ffac bf07ecd0
> > db2a1440 00000000
> > [ 5675.083357] de00: db65de24 bf0c3ee0 00000000 bf0a3200 dc0dfe10 dc0dfe44
> > db65de3c db65de28
> > [ 5675.091574] de20: bf08855c bf07ff58 dc11d800 dc7e0400 db65de4c db65de40
> > bf07425c bf0883d4
> > [ 5675.099790] de40: db65de5c db65de50 bf095538 bf07424c db65de7c db65de60
> > c04f1df4 bf095534
> > [ 5675.108006] de60: dc11d800 dc7e0400 bf0a3200 dc0dfe10 db65de94 db65de80
> > bf09543c c04f1db8
> > [ 5675.116222] de80: dc11d810 dc11d810 db65deac db65de98 c054e140 bf095404
> > dc11d810 dc11d844
> > [ 5675.124439] dea0: db65ded4 db65deb0 c054ca84 c054e124 dc11d810 ffffe000
> > bf0a3200 00000081
> > [ 5675.132656] dec0: c0107f04 db65c000 db65def4 db65ded8 c054cba8 c054c930
> > bf0a3200 0003bd44
> > [ 5675.140872] dee0: 00000800 00000081 db65df0c db65def8 c054bc14 c054cb4c
> > bf0a3200 0003bd44
> > [ 5675.149088] df00: db65df24 db65df10 c054d294 c054bbcc bf0a3440 0003bd44
> > db65df34 db65df28
> > [ 5675.157304] df20: c054e228 c054d270 db65df44 db65df38 bf09570c c054e220
> > db65dfa4 db65df48
> > [ 5675.165520] df40: c0197074 bf095704 db65df64 73727670 6d6b7672 00000000
> > db65df8c db65df68
> > [ 5675.173736] df60: c0144204 c0222324 ffffe000 c0107f04 ffffe000 c0107f04
> > db65dfb0 00000006
> > [ 5675.181954] df80: db65dfac 0065df90 c010b474 00000002 beaabc28 00000000
> > 00000000 db65dfa8
> > [ 5675.190169] dfa0: c0107d20 c0196f34 00000002 beaabc28 0003bd44 00000800
> > b6f15688 00002002
> > [ 5675.198387] dfc0: 00000002 beaabc28 00000000 00000081 beaabf0c 0003bd08
> > beaabe0c 00000001
> > [ 5675.206604] dfe0: b6eed521 beaabbdc 0001f7f8 b6eed528 800b0030 0003bd44
> > 00000000 00000000
> > [ 5675.214813] Backtrace:
> > [ 5675.217482] [<bf08010c>] (PollForValueKM [pvrsrvkm]) from [<bf091130>]
> > (SGXPrePowerState.part.2+0x1d4/0x214 [pvrsrvkm])
> > [ 5675.228319]  r10:00000000 r9:db65c000 r8:00000000 r7:00000002
> > r6:00000000 r5:dc753000
> > [ 5675.236180]  r4:00000000
> > [ 5675.238917] [<bf090f5c>] (SGXPrePowerState.part.2 [pvrsrvkm]) from
> > [<bf091464>] (SGXPrePowerState+0x2c/0x30 [pvrsrvkm])
> > [ 5675.249749]  r8:dc0dfe44 r7:00000000 r6:bf07e9a4 r5:00000002 r4:db5e7080
> >
> > [ 5675.256669] [<bf091438>] (SGXPrePowerState [pvrsrvkm]) from
> > [<bf07ea00>] (PVRSRVDevicePrePowerStateKM_AnyVaCb+0x5c/0x80 [pvrsrvkm])
> > [ 5675.268739] [<bf07e9a4>] (PVRSRVDevicePrePowerStateKM_AnyVaCb
> > [pvrsrvkm]) from [<bf07e0b0>]
> > (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x3c/0x5c [pvrsrvkm])
> > [ 5675.282795]  r5:db65ddc8 r4:00000000
> > [ 5675.286576] [<bf07e078>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va
> > [pvrsrvkm]) from [<bf07ed04>] (PVRSRVSetDevicePowerStateKM+0x40/0xac
> > [pvrsrvkm])
> > [ 5675.299935]  r3:00000000 r2:00000000 r1:bf07e9a4
> > [ 5675.304571]  r6:00000002 r5:00000000 r4:bf0c3f48
> > [ 5675.309398] [<bf07ecc4>] (PVRSRVSetDevicePowerStateKM [pvrsrvkm]) from
> > [<bf07ffac>] (PVRSRVDeinitialiseDevice+0x60/0x1c0 [pvrsrvkm])
> > [ 5675.321363]  r7:bf0c3fa8 r6:db00ce00 r5:00000000 r4:00000000
> > [ 5675.327238] [<bf07ff4c>] (PVRSRVDeinitialiseDevice [pvrsrvkm]) from
> > [<bf08855c>] (SysDeinitialise+0x194/0x260 [pvrsrvkm])
> > [ 5675.338245]  r8:dc0dfe44 r7:dc0dfe10 r6:bf0a3200 r5:00000000 r4:bf0c3ee0
> >
> > [ 5675.345162] [<bf0883c8>] (SysDeinitialise [pvrsrvkm]) from [<bf07425c>]
> > (PVRCore_Cleanup+0x1c/0x34 [pvrsrvkm])
> > [ 5675.355205]  r5:dc7e0400 r4:dc11d800
> > [ 5675.358981] [<bf074240>] (PVRCore_Cleanup [pvrsrvkm]) from [<bf095538>]
> > (PVRSRVDrmUnload+0x10/0x14 [pvrsrvkm])
> > [ 5675.369141] [<bf095528>] (PVRSRVDrmUnload [pvrsrvkm]) from [<c04f1df4>]
> > (drm_dev_unregister+0x48/0xe8)
> > [ 5675.378587] [<c04f1dac>] (drm_dev_unregister) from [<bf09543c>]
> > (PVRSRVDrmRemove+0x44/0x68 [pvrsrvkm])
> > [ 5675.387936]  r7:dc0dfe10 r6:bf0a3200 r5:dc7e0400 r4:dc11d800
> > [ 5675.393726] [<bf0953f8>] (PVRSRVDrmRemove [pvrsrvkm]) from [<c054e140>]
> > (platform_drv_remove+0x28/0x48)
> > [ 5675.403160]  r5:dc11d810 r4:dc11d810
> > [ 5675.406756] [<c054e118>] (platform_drv_remove) from [<c054ca84>]
> > (device_release_driver_internal+0x160/0x200)
> > [ 5675.416712]  r5:dc11d844 r4:dc11d810
> > [ 5675.420306] [<c054c924>] (device_release_driver_internal) from
> > [<c054cba8>] (driver_detach+0x68/0xcc)
> > [ 5675.429569]  r9:db65c000 r8:c0107f04 r7:00000081 r6:bf0a3200
> > r5:ffffe000 r4:dc11d810
> > [ 5675.437349] [<c054cb40>] (driver_detach) from [<c054bc14>]
> > (bus_remove_driver+0x54/0xa8)
> > [ 5675.445475]  r7:00000081 r6:00000800 r5:0003bd44 r4:bf0a3200
> > [ 5675.451160] [<c054bbc0>] (bus_remove_driver) from [<c054d294>]
> > (driver_unregister+0x30/0x50)
> > [ 5675.459634]  r5:0003bd44 r4:bf0a3200
> > [ 5675.463228] [<c054d264>] (driver_unregister) from [<c054e228>]
> > (platform_driver_unregister+0x14/0x18)
> > [ 5675.472486]  r5:0003bd44 r4:bf0a3440
> > [ 5675.476175] [<c054e214>] (platform_driver_unregister) from [<bf09570c>]
> > (PVRSRVDrmExit+0x14/0x908 [pvrsrvkm])
> > [ 5675.486242] [<bf0956f8>] (PVRSRVDrmExit [pvrsrvkm]) from [<c0197074>]
> > (SyS_delete_module+0x14c/0x1d0)
> > [ 5675.495517] [<c0196f28>] (SyS_delete_module) from [<c0107d20>]
> > (ret_fast_syscall+0x0/0x54)
> > [ 5675.503818]  r6:00000000 r5:beaabc28 r4:00000002
> > [ 5675.508461] Code: e92ddff0 e24cb004 e24dd01c e1a09000 (e5904000)
> > [ 5675.514586] ---[ end trace f0152b7ee610e9b6 ]---
> > /etc/rc0.d/K08rc.pvr: line 75:  8566 Segmentation fault      rmmod pvrsrvkm
> >
> >
> > How to resolve this error ?
> >
> > thanks
> > Ankur
> >

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


