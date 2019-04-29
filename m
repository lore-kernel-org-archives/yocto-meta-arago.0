Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 7950C529B7
	for <meta-arago@arago-project.org>;
	Mon, 29 Apr 2019 18:14:05 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3TIDcxq079689
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 13:13:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556561618;
	bh=RRBYDpSyps1hOIt3Hr0JAnR65fHT1jcx8C/pROL8Nec=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WXucis0nFMQ2exZTZ5VFacz3+stek7GUE06hsVAQdgbS7qNn710fE8j3Pc9nG+0FJ
	OKxG8mL0sNwH6JrVffQ0IMqiWWX883dzVDfR+1xRApiP+sGJ1rNvyP7n2TXyKH0NrG
	veLz4McM7lV2Rf0tdSpde/sJwTMPZDpkpuoAU1vY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3TIDcNj086257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 29 Apr 2019 13:13:38 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 29 Apr 2019 13:13:38 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 29 Apr 2019 13:13:38 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3TIDc8f114022;
	Mon, 29 Apr 2019 13:13:38 -0500
Date: Mon, 29 Apr 2019 14:13:37 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Andrew F. Davis" <afd@ti.com>
Message-ID: <20190429181337.GD19665@beryl>
References: <20190423183835.17911-1-dmurphy@ti.com>
	<4c8d1973-2b34-77d6-73cd-c49e5a74eb1b@ti.com>
	<9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
MIME-Version: 1.0
In-Reply-To: <9400ea6c-9b24-ffff-d07e-705f4e8358e1@ti.com>
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
X-List-Received-Date: Mon, 29 Apr 2019 18:14:06 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 23, 2019 at 02:52:20PM -0400, Andrew F. Davis wrote:
> On 4/23/19 2:40 PM, Dan Murphy wrote:
> > +Andrew
> > 
> > On 4/23/19 1:38 PM, Dan Murphy wrote:
> >> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> >> ---
> >>  .../recipes-security/optee/optee-os_git.bbappend              | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >> index 2204a50c..ee87b3c7 100644
> >> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> >> @@ -2,7 +2,7 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >>  
> >>  PR_append = ".arago0"
> >>  
> >> -PV = "3.2.0+git${SRCPV}"
> >> +PV = "3.5.0+git${SRCPV}"

> Might want to do the same for client/test, but they got tagged at 3.4.0,
> I've moved the HEAD forward to 3.5.0, we can wait till then next rc tag
> to move them here, it should not be a problem.

Andrew,

It seems there were few more commits that went into the official 3.5.0 
release, which was released 3 days ago. Do you want to re-merge to include 
those?

Denys


> >>  is_armv7 = "1"
> >>  is_armv7_aarch64 = "0"
> >> @@ -11,7 +11,7 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> >>             file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> >>  "
> >>  BRANCH = "ti_optee_os"
> >> -SRCREV = "48952f9f76d885df4cb65f8479a4cf7dedf0ee54"
> >> +SRCREV = "b38f935200f67f9408d7c5d99fe703e5cc806c65"
> >>  
> >>  ARMCORE = "CFG_ARM32_core=y ta-targets=ta_arm32"
> >>  ARMCORE_aarch64 = "CFG_ARM64_core=y ta-targets=ta_arm64"
> >>

