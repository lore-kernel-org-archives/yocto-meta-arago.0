Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 29D525298A
	for <meta-arago@arago-project.org>;
	Fri,  9 Sep 2016 17:45:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u89Hjr5J014447
	for <meta-arago@arago-project.org>; Fri, 9 Sep 2016 12:45:53 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89Hjq2j010175
	for <meta-arago@arago-project.org>; Fri, 9 Sep 2016 12:45:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Sep 2016 12:45:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89Hjq6B031633;
	Fri, 9 Sep 2016 12:45:52 -0500
Date: Fri, 9 Sep 2016 13:45:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160909174549.GX29658@edge>
References: <bf4e78a8-7aba-110c-53fe-4fad4c23b10f@ti.com>
	<20160909173659.GW29658@edge>
	<1d6aba93-3f3c-dd6d-80c2-b8a82dc6a3f0@ti.com>
MIME-Version: 1.0
In-Reply-To: <1d6aba93-3f3c-dd6d-80c2-b8a82dc6a3f0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: k2 ramfs missing firmwre
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
X-List-Received-Date: Fri, 09 Sep 2016 17:45:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 09, 2016 at 01:42:02PM -0400, Jacob Stiffler wrote:
> 
> 
> On 9/9/2016 1:36 PM, Denys Dmytriyenko wrote:
> >On Fri, Sep 09, 2016 at 09:31:25AM -0400, Jacob Stiffler wrote:
> >>Hi,
> >>
> >>The K2 ramfs is missing the firmwares necessary to boot up. The K2
> >>ramfs is simply the tisdk-server-rootfs-image in cpio.gz format.
> >>
> >>These firmwares are available in the k2-initramfs image. However,
> >>when u-boot is configured for ramfs, the initramfs is not loaded
> >>prior to booting. Therefore it seems that the firmwares in the
> >>k2-initramfs should also be available in the
> >>tisdk-server-rootfs-image. Is this correct? Would this cause any
> >>conflict with other boot methods which do use the initramfs?
> >>
> >>If these firmwares can go into the tisdk-server-rootfs-image, which
> >>would be the most appropriate pacakgegroup?
> >Jake,
> >
> >Those firmware images are already there in the rootfs, regardless of the
> >format - they are being pulled by kernel dependencies individually:
> >
> >$ xz -dc tisdk-server-rootfs-image-k2hk-evm-20160909112210.rootfs.cpio.xz | cpio -t 'lib/firmware/ks2*'
> >lib/firmware/ks2_gbe_serdes.bin
> >lib/firmware/ks2_pa_pdsp2_classify1.bin
> >lib/firmware/ks2_pa_pdsp1_classify1.bin
> >lib/firmware/ks2_pa_pdsp0_classify1.bin
> >lib/firmware/ks2_pa_pdsp3_classify2.bin
> >lib/firmware/ks2_xgbe_serdes.bin
> >lib/firmware/ks2_pcie_serdes.bin
> >lib/firmware/ks2_pa_pdsp5_pam.bin
> >lib/firmware/ks2_pa_pdsp4_pam.bin
> >1488976 blocks
> >
> >$ xz -dc tisdk-server-rootfs-image-k2e-evm-20160909063519.rootfs.cpio.xz | cpio -t 'lib/firmware/ks2*'
> >lib/firmware/ks2_gbe_serdes.bin
> >lib/firmware/ks2_pa_in4_pdsp0.bin
> >lib/firmware/ks2_pa_eg2_pdsp0.bin
> >lib/firmware/ks2_pa_in4_pdsp1.bin
> >lib/firmware/ks2_pa_in3_pdsp0.bin
> >lib/firmware/ks2_pa_in0_pdsp0.bin
> >lib/firmware/ks2_pa_eg0_pdsp2.bin
> >lib/firmware/ks2_pa_eg0_pdsp1.bin
> >lib/firmware/ks2_pa_in1_pdsp0.bin
> >lib/firmware/ks2_pa_post_pdsp0.bin
> >lib/firmware/ks2_pa_in2_pdsp0.bin
> >lib/firmware/ks2_pa_in1_pdsp1.bin
> >lib/firmware/ks2_xgbe_serdes.bin
> >lib/firmware/ks2_pcie_serdes.bin
> >lib/firmware/ks2_pa_in0_pdsp1.bin
> >lib/firmware/ks2_pa_eg1_pdsp0.bin
> >lib/firmware/ks2_pa_post_pdsp1.bin
> >lib/firmware/ks2_pa_eg0_pdsp0.bin
> >1460743 blocks
> >
> >
> >What's missing? Although, I don't see qmss one...
> That is the one that is missing. Thank you for pointing out that
> these firmwares are kernel dependencies. I knew that at one time...
> 
> I will submit a patch.

Oh, I already did, once I noticed qmss was missing. Let me know if anything 
else is missing or incorrect. Thanks.

-- 
Denys

