Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2D715529A0
	for <meta-arago@arago-project.org>;
	Sat, 24 Feb 2018 04:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1O4P8WO007981
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 22:25:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519446308;
	bh=vQd/WXMvCakkZmGYYy5A517FVbDaRrwfMRrvVB+5OTU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RDl0c+ekltBbAg9cPE4PH9UZLKr30pMND+B6qiF5YFHpAcyh6Tw0IigW2FeeQP7Lz
	pKToBbJJ+m7OUgdbEJlgnW1arpmBWKsaNl5KMotKFUbatsDPs+lyca0dkPZFHpvpdF
	Efq8JSQikiIyGpneXQKwXxpHYgQy9V5lkNA/Hg0I=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1O4P8iN022326
	for <meta-arago@arago-project.org>; Fri, 23 Feb 2018 22:25:08 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 23 Feb 2018 22:25:07 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 23 Feb 2018 22:25:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1O4P7mu009437;
	Fri, 23 Feb 2018 22:25:07 -0600
Date: Fri, 23 Feb 2018 23:25:06 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180224042506.GA12117@edge>
References: <1519177646-5449-1-git-send-email-x0157990@ti.com>
	<b5a492dd-fe37-b40f-ebd9-e5e4f4424622@ti.com>
MIME-Version: 1.0
In-Reply-To: <b5a492dd-fe37-b40f-ebd9-e5e4f4424622@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com,
	Djordje Senicic <x0157990@ti.com>
Subject: Re: [EXTERNAL] [PATCH] opencv: Fix OpenCL linking with unused DSP library
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
X-List-Received-Date: Sat, 24 Feb 2018 04:25:37 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Done.

On Fri, Feb 23, 2018 at 02:32:46PM -0500, Jacob Stiffler wrote:
> Denys,
> 
> Can you also apply this to morty?
> 
> Thank you,
> 
> Jake
> 
> 
> On 2/20/2018 8:47 PM, Djordje Senicic wrote:
> >Signed-off-by: Djordje Senicic <x0157990@ti.com>
> >---
> >  meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> >index bf33a2e..3915c4d 100644
> >--- a/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> >+++ b/meta-arago-distro/recipes-support/opencv/opencv_3.1.bbappend
> >@@ -11,7 +11,7 @@ SRC_URI_append += "\
> >       file://setupEnv.sh \
> >  "
> >-SRCREV_opencv = "4458601eb2766461f2f9da0d2527ff25ecb20284"
> >+SRCREV_opencv = "9b88e8c746e531a1b4cc61e5235e4e747c319945"
> >  DEPENDS_remove_keystone = "qtbase"
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

