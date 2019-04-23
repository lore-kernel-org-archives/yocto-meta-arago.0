Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6B8BF52985
	for <meta-arago@arago-project.org>;
	Tue, 23 Apr 2019 21:45:35 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3NLjBrI032929
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 16:45:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556055911;
	bh=sixjZesQbClrNDf11RZxq0e9Mrq0eNwUEEhcz/oOMT4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Tj02/IqmqLPGPYzb8IMaGlBZ5e0Nxo6utKUTdgLju8nIQafr9D4bkGpGv5YfyirXw
	PkWY0PB4GCPruAjiSVbC/KCOxkdDlUDYJgH+mfTxcaIs5T0Y+WHomnQy0iq2ryE66e
	qNZ5ZaPrvTSALnZKwH3dxrZGrGt82Hv3v0G/t+lA=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3NLjBJp103169
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 23 Apr 2019 16:45:11 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 23 Apr 2019 16:45:10 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 23 Apr 2019 16:45:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3NLjAjO059951;
	Tue, 23 Apr 2019 16:45:10 -0500
Date: Tue, 23 Apr 2019 17:45:10 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20190423214510.GB6705@beryl>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
	<128ca4ca-f51a-1732-2293-25e000b03a5e@ti.com>
MIME-Version: 1.0
In-Reply-To: <128ca4ca-f51a-1732-2293-25e000b03a5e@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] optee-os: Update OPTEE OS tag to 3.5.0-rc1 and ti2019.01-rc1
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
X-List-Received-Date: Tue, 23 Apr 2019 21:45:35 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

ERROR: QA Issue: optee-os: The LIC_FILES_CHKSUM does not match for file://.../optee-os/3.4.0+gitAUTOINC+b38f935200-r0.arago1/git/LICENSE;md5=69663ab153298557a59c67a60a743e5b
optee-os: Check if the license information has changed in .../optee-os/3.4.0+gitAUTOINC+b38f935200-r0.arago1/git/LICENSE to verify that the LICENSE value "BSD" remains valid [license-checksum]


On Tue, Apr 23, 2019 at 01:54:24PM -0500, Dan Murphy wrote:
> Andrew
> 
> On 4/23/19 1:52 PM, Andrew F. Davis wrote:
> > On 4/23/19 2:40 PM, Dan Murphy wrote:
> >> +Andrew
> >>
> >> On 4/23/19 1:38 PM, Dan Murphy wrote:
> >>> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >>> ---
> >>>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
> >>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >>> index 2204a50c..ee87b3c7 100644
> >>> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >>> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >>> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>>  
> >>>  PR_append = ".arago0"
> >>>  
> >>> -PV = "3.2.0+git${SRCPV}"
> >>> +PV = "3.5.0+git${SRCPV}"
> > 
> > Might want to do the same for client/test, but they got tagged at 3.4.0,
> > I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
> > to move them here, it should not be a problem.
> > 
> 
> Yeah rc1 was not tagged with these so rc2 we will update them
> 
> Dan
> 
> > Andrew
> > 
> >>>  
> >>>  is_armv7 = "1"
> >>>  is_armv7_aarch64 = "0"
> >>> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> >>>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> >>>  "
> >>>  BRANCH = "ti_optee_os"
> >>> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
> >>> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
> >>>  
> >>>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
> >>>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
> >>>

