Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id D13A552ACE
	for <meta-arago@arago-project.org>;
	Mon,  7 Jun 2021 21:21:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 157LM3vv116818;
	Mon, 7 Jun 2021 16:22:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1623100923;
	bh=wBpw9t1KhM8vBCOR15Ng48TRLiWR6vkxDvj8bymmg2w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Yeye5AlLmteskAZPsFH0xy+EzZYZEB+aJCYYcQg7mG0FIfN3mZGs8l19liWceA1/t
	7CYA4q3x84lnGDgR4Z+0NguLVKcVHUes5IEn8eA54y4QkDEoFaMTfueQDb/wqCr1P5
	DOL+meFVA1Smd5oJJ3WdsVjlBbhmrGhBrtTQf53w=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 157LM2GF048222
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Jun 2021 16:22:03 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 7 Jun 2021 16:22:02 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 7 Jun 2021 16:22:02 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 157LM2tb071888;
	Mon, 7 Jun 2021 16:22:02 -0500
Date: Mon, 7 Jun 2021 16:22:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Priya N S <priya.ns@mistralsolutions.com>
Message-ID: <20210607212139.2n6flly5ek3bb5nh@oyster>
References: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
In-Reply-To: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Sekhar Nori <nsekhar@ti.com>
Subject: Re: [master PATCH 0/3] create-sdcard: Fix rootfs tarball search and selection
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
X-List-Received-Date: Mon, 07 Jun 2021 21:21:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 16:05-20210607, Priya N S wrote:
> From: Priya N S <priya.ns@ti.com>
> 
> Hi All,
> Below are the patches to fix the issues observed in the create-sdcard
> script.

a) Do these apply to meta-arago?
b) why not use the wic and bmap files instead?

> 
> Issue:
> 1. The create-sdcard script uses 'rootfs' as a regex keyword to find
> and list the filesystem tarballs which are available in the SDK
> package. As in the current SDK packages, the tarball names are in the
> following format,
> tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz
> Which doesn't have the rootfs keyword. This fails to list the tarballs
> available in the package and crashes the script execution.
> 2. The create-sdcard script detects a partitioned SD card as not
> partitioned because of the failure of the size check condition in the
> script.
> 
> Fix:
> 1. The 'image' is used as the regex keyword to match the tarball names
> in the SDK packages.
> 2. The usage of the cylinder size unit for partitioning the SD card is
> removed since the cylinder size is SD card manufacturer dependent.
> The parted command is replaced with fdisk since fdisk is an available
> installed utility.
> 
> Priya N S (3):
>   create-sdcard.sh: fix regex used for rootfs tarball
>   create-sdcard: Fix wrong rootfs tarball selection
>   create-sdcard.sh: Stop using cylinder as unit for partition size
> 
>  create-sdcard.sh | 75 +++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 58 insertions(+), 17 deletions(-)
> 
> -- 
> 2.19.1.windows.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

