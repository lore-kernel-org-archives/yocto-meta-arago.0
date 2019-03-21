Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 44DA852976
	for <meta-arago@arago-project.org>;
	Thu, 21 Mar 2019 20:17:33 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LKHKXF013103
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 15:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553199440;
	bh=JKEwwHUE6vR8qN7cHpckvJALKyK277jDz8T/sLagqDM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VNJCoBNL1ITXO9iKWBvJz7jiF/IFEBlD/emncR7mNQ6os70E08f0b0KVuDGHNXsqi
	pxP3/rdTARJwcOiGUhEbjJ4pfQmutu2q4BHF+0+TquQXnhYP4yxCZWx7AmDz6nbYaZ
	+ldt2p0A9lyrQYjFXQit+j2p566UZT1uPHvX+l5Q=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LKHKPU070443
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 21 Mar 2019 15:17:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 15:17:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 15:17:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LKHJ7V014790;
	Thu, 21 Mar 2019 15:17:19 -0500
Date: Thu, 21 Mar 2019 16:17:19 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>
Message-ID: <20190321201719.GD30002@beryl>
References: <20190315100310.20229-1-x0157990@ti.com>
	<20190318183825.GB3374@beryl>
	<9cb0d7c41bdc469599a9cc1c3e3df2e1@ti.com>
MIME-Version: 1.0
In-Reply-To: <9cb0d7c41bdc469599a9cc1c3e3df2e1@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [rocko/master][PATCH] [matrix-gui-apps] SRCREV bump for TIDL demo file path fix
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
X-List-Received-Date: Thu, 21 Mar 2019 20:17:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

It has to follow OpenEmbedded guidelines:
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


On Mon, Mar 18, 2019 at 02:58:43PM -0400, Senicic, Djordje wrote:
>    Is this one is clearer?
> 
>    [meta-arago][rocko/master][PATCH] matrix-gui-apps: SRCREV bump for TIDL
>    demo file path fix.
> 
>    A change in matrix-gui-v2-apps repo need to be included.
> 
>      ----------------------------------------------------------------------
> 
>    From: Dmytriyenko, Denys
>    Sent: Monday, March 18, 2019 2:38:25 PM
>    To: Senicic, Djordje
>    Cc: meta-arago@arago-project.org
>    Subject: Re: [meta-arago] [rocko/master][PATCH] [matrix-gui-apps] SRCREV
>    bump for TIDL demo file path fix
>     
>    Is the subject line correct?
> 
>    On Fri, Mar 15, 2019 at 06:03:10AM -0400, Djordje Senicic wrote:
>    > Signed-off-by: Djordje Senicic <x0157990@ti.com>
>    > ---
>    >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>    >  1 file changed, 2 insertions(+), 2 deletions(-)
>    >
>    > diff --git
>    a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>    b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>    > index 82882ea4..8cd90427 100644
>    > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>    > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>    > @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =
>    "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>    >  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>    > 
>    >  SRC_URI =
>    "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
>    > -SRCREV = "f9fa5cb158902b6a3520fb7e853cc049ea920ae5"
>    > +SRCREV = "447330830a22028958c361f3f54020dc26427856"
>    >  BRANCH = "master"
>    > -INC_PR = "r67"
>    > +INC_PR = "r68"
>    > 
>    >  # Pull in the base package for installing matrix applications
>    >  require matrix-gui-apps.inc
>    > --
>    > 2.17.1
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

