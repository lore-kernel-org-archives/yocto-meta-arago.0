Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 2AD905298D
	for <meta-arago@arago-project.org>;
	Fri,  9 Sep 2016 17:37:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u89Hb0ZK015836
	for <meta-arago@arago-project.org>; Fri, 9 Sep 2016 12:37:00 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89Hb0vN008911
	for <meta-arago@arago-project.org>; Fri, 9 Sep 2016 12:37:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 9 Sep 2016 12:37:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u89Hb0qT008649;
	Fri, 9 Sep 2016 12:37:00 -0500
Date: Fri, 9 Sep 2016 13:36:59 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160909173659.GW29658@edge>
References: <bf4e78a8-7aba-110c-53fe-4fad4c23b10f@ti.com>
MIME-Version: 1.0
In-Reply-To: <bf4e78a8-7aba-110c-53fe-4fad4c23b10f@ti.com>
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
X-List-Received-Date: Fri, 09 Sep 2016 17:37:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 09, 2016 at 09:31:25AM -0400, Jacob Stiffler wrote:
> Hi,
> 
> The K2 ramfs is missing the firmwares necessary to boot up. The K2
> ramfs is simply the tisdk-server-rootfs-image in cpio.gz format.
> 
> These firmwares are available in the k2-initramfs image. However,
> when u-boot is configured for ramfs, the initramfs is not loaded
> prior to booting. Therefore it seems that the firmwares in the
> k2-initramfs should also be available in the
> tisdk-server-rootfs-image. Is this correct? Would this cause any
> conflict with other boot methods which do use the initramfs?
> 
> If these firmwares can go into the tisdk-server-rootfs-image, which
> would be the most appropriate pacakgegroup?

Jake,

Those firmware images are already there in the rootfs, regardless of the 
format - they are being pulled by kernel dependencies individually:

$ xz -dc tisdk-server-rootfs-image-k2hk-evm-20160909112210.rootfs.cpio.xz | cpio -t 'lib/firmware/ks2*'
lib/firmware/ks2_gbe_serdes.bin
lib/firmware/ks2_pa_pdsp2_classify1.bin
lib/firmware/ks2_pa_pdsp1_classify1.bin
lib/firmware/ks2_pa_pdsp0_classify1.bin
lib/firmware/ks2_pa_pdsp3_classify2.bin
lib/firmware/ks2_xgbe_serdes.bin
lib/firmware/ks2_pcie_serdes.bin
lib/firmware/ks2_pa_pdsp5_pam.bin
lib/firmware/ks2_pa_pdsp4_pam.bin
1488976 blocks

$ xz -dc tisdk-server-rootfs-image-k2e-evm-20160909063519.rootfs.cpio.xz | cpio -t 'lib/firmware/ks2*'
lib/firmware/ks2_gbe_serdes.bin
lib/firmware/ks2_pa_in4_pdsp0.bin
lib/firmware/ks2_pa_eg2_pdsp0.bin
lib/firmware/ks2_pa_in4_pdsp1.bin
lib/firmware/ks2_pa_in3_pdsp0.bin
lib/firmware/ks2_pa_in0_pdsp0.bin
lib/firmware/ks2_pa_eg0_pdsp2.bin
lib/firmware/ks2_pa_eg0_pdsp1.bin
lib/firmware/ks2_pa_in1_pdsp0.bin
lib/firmware/ks2_pa_post_pdsp0.bin
lib/firmware/ks2_pa_in2_pdsp0.bin
lib/firmware/ks2_pa_in1_pdsp1.bin
lib/firmware/ks2_xgbe_serdes.bin
lib/firmware/ks2_pcie_serdes.bin
lib/firmware/ks2_pa_in0_pdsp1.bin
lib/firmware/ks2_pa_eg1_pdsp0.bin
lib/firmware/ks2_pa_post_pdsp1.bin
lib/firmware/ks2_pa_eg0_pdsp0.bin
1460743 blocks


What's missing? Although, I don't see qmss one...

-- 
Denys

