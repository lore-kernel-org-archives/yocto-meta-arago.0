Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 666F65297F
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 18:22:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JILseT070724
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:21:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560968514;
	bh=yTjiiE4Ac35V8x6uQZ+LfUUvdtc4dP+DU/bxqS3bNu8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=b5u3yokUM1+S+euJ7vCkfs3fjkWHSF/rI8wYjfyvWElvLh1ab0qhX0oAG64s7XCQu
	CyOHq8XQ8Q6kfjPZcI17M8Jsl1mhUXyz1xUrZwlTcnSOy3b1sTrhsLd3iERG/uL1MU
	mUjaQgml1lkXJoT7CauAeBOGoiWg7/Q2yO2ERBpY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JILsXd118605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:21:54 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 13:21:54 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 13:21:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JILsmM103040;
	Wed, 19 Jun 2019 13:21:54 -0500
Date: Wed, 19 Jun 2019 14:21:54 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20190619182154.GH32001@beryl>
References: <1560960696-17318-1-git-send-email-anandb@ti.com>
	<20190619182041.GG32001@beryl>
MIME-Version: 1.0
In-Reply-To: <20190619182041.GG32001@beryl>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH 1/1] linux-ti-staging: update to latest version
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
X-List-Received-Date: Wed, 19 Jun 2019 18:22:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 19, 2019 at 02:20:41PM -0400, Denys Dmytriyenko wrote:
> On Wed, Jun 19, 2019 at 09:41:36PM +0530, Anand Balagopalakrishnan wrote:
> > Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> > ---
> >  recipes-kernel/linux/linux-ti-staging_4.19.bb | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> > index 26b388b..ceec516 100644
> > --- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
> > +++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
> > @@ -56,11 +56,11 @@ S = "${WORKDIR}/git"
> >  
> >  BRANCH = "ti-linux-4.19.y"
> >  
> > -SRCREV = "7d94bf0b5ba7a68aa735c422f40d53957d094f8b"
> > -PV = "4.19.38+git${SRCPV}"
> > +SRCREV = "d343b32d0ab8262cf0a0fa8f4bd2bf1745685984"
> > +PV = "4.19.50+git${SRCPV}"
> >  
> >  # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
> > -MACHINE_KERNEL_PR_append = "c"
> > +MACHINE_KERNEL_PR_append = "d"
> 
> PR should be reset when PV gets updated.
> 
> Also, corresponding RT srecipe hould be updated as well.

Oh, and this is the wrong list for this...


> >  PR = "${MACHINE_KERNEL_PR}"
> >  
> >  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
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

