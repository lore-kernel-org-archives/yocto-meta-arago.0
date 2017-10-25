Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5515B52093
	for <meta-arago@arago-project.org>;
	Wed, 25 Oct 2017 07:49:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9P7n8w6025271
	for <meta-arago@arago-project.org>; Wed, 25 Oct 2017 02:49:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508917748;
	bh=ijYvCwLvCNY6Oi7tzz3IZV8RKoQPHQRA+MUnNRQK5Po=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=JGbtT9Tn7rx3amBsGQzQ/Eztgj7lPzo79kJyU50Z80wD8U0LnuyZFz7Zx/h7qfsHi
	mpUU8SDwFyczURBuCIiCbPceJsjPHLTaeYMWMF5OtPUYJu/P0vu+iy4cKHlNcOMDV+
	HylOFtsLdjDeKzg2qP9/ZetDf9LBioSgO7Wk6XRs=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9P7n2uL031086
	for <meta-arago@arago-project.org>; Wed, 25 Oct 2017 02:49:03 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 25 Oct 2017 02:49:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 25 Oct 2017 02:49:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9P7n15T002499;
	Wed, 25 Oct 2017 02:49:01 -0500
Date: Wed, 25 Oct 2017 03:48:46 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20171025074845.GM16210@edge>
References: <20171023215711.36722-1-esc@ti.com>
	<d58e46b0-58c4-53c4-7926-88c7c8460de0@ti.com>
MIME-Version: 1.0
In-Reply-To: <d58e46b0-58c4-53c4-7926-88c7c8460de0@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [PATCH] ocl: Update to v01.01.14.06
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
X-List-Received-Date: Wed, 25 Oct 2017 07:49:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I merged this, but there was original SoB missing - please don't forget to 
include one in the future.

On Tue, Oct 24, 2017 at 01:44:50PM -0400, Jacob Stiffler wrote:
> ACK
> 
> I tested these changes build for am57xx-evm.
> 
> Tested-by: Jacob Stiffler <j-stiffler@ti.com>
> 
> 
> On 10/23/2017 5:57 PM, Emily Curry wrote:
> >* Fix OpenCL example cross-compile failure
> >---
> >  meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> >index 5cd1e02f..d036dfc6 100644
> >--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> >+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> >@@ -1,4 +1,4 @@
> >-PV = "1.1.14.5"
> >+PV = "1.1.14.6"
> >  INC_PR = "r0"
> >  LIC_FILES_CHKSUM = "file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> >@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
> >  OCL_GIT_PROTOCOL = "git"
> >  OCL_GIT_BRANCH = "master"
> >-OCL_SRCREV = "e77c89ddd5c9da66ad0a0eec859958c3d8728f87"
> >+OCL_SRCREV = "03e89944c6dc4ab508698610baef623231de436d"
> >  BRANCH = "${OCL_GIT_BRANCH}"
> >  SRC_URI = "${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

