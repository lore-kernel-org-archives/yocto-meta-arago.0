Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 698AA529BC
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2019 20:17:28 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBCKFrnW124563
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 14:15:53 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576181753;
	bh=YXfkfckMSzop3+96uElVWtdpHuIFFOEbxDSF9+/OGNc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AvNkfEH/WmvcCbbJdjdAv1Bt/vt5ZWH3vZunKEW/ZD8hqDrTDOryp2qNHWff3PWrV
	n6wvcVhBsAyCBvqxO5Ipa9SZ8nrIIbv/vSlKLxpp00nxeTtAVVnDRspvyndCFuUOGS
	cjPLorwOV0MU7T3dxdh7fgE261yPiO5/6Ufx+84U=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBCKFrxZ020779
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Dec 2019 14:15:53 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 12 Dec 2019 14:15:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 12 Dec 2019 14:15:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBCKFq5D083693;
	Thu, 12 Dec 2019 14:15:53 -0600
Date: Thu, 12 Dec 2019 15:15:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20191212201552.GE32050@beryl>
References: <1576096076-22269-1-git-send-email-denys@ti.com>
	<f13acef8-ef6b-8177-f1c7-90b664b066d8@ti.com>
MIME-Version: 1.0
In-Reply-To: <f13acef8-ef6b-8177-f1c7-90b664b066d8@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [thud/master][PATCH] ti-tisdk-setup: update to include latest OOBE fixes
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
X-List-Received-Date: Thu, 12 Dec 2019 20:17:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Done

On Thu, Dec 12, 2019 at 03:13:07PM -0500, Jacob Stiffler wrote:
> Denys,
> 
> Please backport to ti2019.05.
> 
> 
> Thank you,
> 
> Jake
> 
> On 12/11/2019 3:27 PM, Denys Dmytriyenko wrote:
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> >index 8a7737e..9a9368d 100644
> >--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> >+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-setup/ti-tisdk-setup.bb
> >@@ -2,10 +2,10 @@ DESCRIPTION = "Package containing scripts to setup the development host and targ
> >  LICENSE = "BSD"
> >  LIC_FILES_CHKSUM = "file://setup.sh;beginline=3;endline=31;md5=fc4b04a33df6d892c9f4d4a9d92b945e"
> >-PR = "r43"
> >+PR = "r44"
> >  BRANCH ?= "master"
> >-SRCREV = "ebfc94b347bc74ad9590cfbb5588900e31d6bc0e"
> >+SRCREV = "22654923e4597871ba192e58c01d6fc09a38aae4"
> >  SRC_URI = "git://arago-project.org/git/projects/tisdk-setup-scripts.git;protocol=git;branch=${BRANCH}"
> >  S = "${WORKDIR}/git/"

