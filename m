Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 47A5652978
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 18:26:52 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DIQjr9019379
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531506405;
	bh=afhhoxqbMFRupNVfo9YPmOJH4UC3uHT748cnvTihCX4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=a6/d9Hb2ULeJbG8jpQ4oisqlKld6lyHo1Lfdp8tz3NLvK7gvbvA3tGksyOVv/ad+f
	OchUYNNjXw0Px7JkwfowuP0VcR/AtafED67CDVcCFthFbFpnszy8czgqlWKSMpX1/e
	cmRXDuh+IlNYySCfS7rWTlfyCgHf5fuxrAjxsK/o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIQjk9005470
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:26:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:26:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 13:26:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DIQj61028629;
	Fri, 13 Jul 2018 13:26:45 -0500
Date: Fri, 13 Jul 2018 14:26:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20180713182606.GJ25410@beryl>
References: <1531422891-23069-1-git-send-email-a0271529@ti.com>
	<0ea71103760644a5aab9a6815740750a@ti.com>
MIME-Version: 1.0
In-Reply-To: <0ea71103760644a5aab9a6815740750a@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Senicic,
	Djordje" <d-senicic1@ti.com>
Subject: Re: [EXTERNAL] [ti2018.01/rocko/master] [PATCH 1/4] matrix-gui-apps-git.inc: bump SRCREV to get tidl submenu and apps
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
X-List-Received-Date: Fri, 13 Jul 2018 18:26:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I'm still waiting on the test results from last night - there were several 
builds scheduled, so it's taking much longer...


On Fri, Jul 13, 2018 at 02:10:06PM -0400, Stiffler, Jacob wrote:
> Denys,
> 
> Can you please apply this set to the ti2018.01 branch?
> 
> Thank you,
> Jake
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Gou, Hongmei
> > Sent: Thursday, July 12, 2018 3:15 PM
> > To: meta-arago@arago-project.org
> > Cc: Gou, Hongmei; Senicic, Djordje
> > Subject: [EXTERNAL] [meta-arago] [ti2018.01/rocko/master] [PATCH 1/4]
> > matrix-gui-apps-git.inc: bump SRCREV to get tidl submenu and apps
> > 
> > Signed-off-by: Hongmei Gou <a0271529@ti.com>
> > ---
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > index 210be27..1484299 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > @@ -4,9 +4,9 @@ LICENSE_CHECKSUM =
> > "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> >  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> > 
> >  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-
> > apps.git;protocol=git;branch=${BRANCH}"
> > -SRCREV = "65fee8957447ae4e403ad324acf735d811b2c412"
> > +SRCREV = "5a048c929e11465a261a9c483b7719754b1c917e"
> >  BRANCH = "master"
> > -INC_PR = "r52"
> > +INC_PR = "r53"
> > 
> >  # Pull in the base package for installing matrix applications
> >  require matrix-gui-apps.inc
> > --
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

