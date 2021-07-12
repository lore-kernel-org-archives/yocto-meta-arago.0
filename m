Return-Path: <a-m1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id D1F7C52B17
	for <meta-arago@arago-project.org>;
	Mon, 12 Jul 2021 10:37:18 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16CAbQto090373;
	Mon, 12 Jul 2021 05:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626086246;
	bh=CL2W8+Pa5CLx0SkpG8MESKGsiDB1SzS26kkr0GIfv/w=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=GSpc7jyCFJIN/KPHgRbbQY9mrOA9R6MVeyqmOTaXze6fdsegRbBA0TFInL/ZthxPk
	Lah9Ml26wJbv7TDpjhNaMOphVJ0z+he4p84k1B3MsTgTHdKw28t931nCBDqFQawrUq
	QjXOoOJJpXDwEB9wg02Sw8VG0q+0LqpnCbxjQe6w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16CAbQiu124044
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 12 Jul 2021 05:37:26 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 12 Jul 2021 05:37:25 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 12 Jul 2021 05:37:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16CAbOx9066267;
	Mon, 12 Jul 2021 05:37:25 -0500
Date: Mon, 12 Jul 2021 16:07:24 +0530
From: Aparna M <a-m1@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, "Siraswar, Yogesh" <yogeshs@ti.com>,
	"denis@denix.org" <denis@denix.org>
Message-ID: <20210712103724.cwmsk7wqbo6vpvij@ti.com>
References: <20210624151425.4314-1-nikhil.nd@ti.com>
	<20210624151631.gvdrwhtflmenyd5a@NiksLab>
MIME-Version: 1.0
In-Reply-To: <20210624151631.gvdrwhtflmenyd5a@NiksLab>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] Re: [PATCH] matrix-gui-apps-git: Update SRCREV to the latest
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
X-List-Received-Date: Mon, 12 Jul 2021 10:37:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping.

Need to get this change merged for nightly builds. Please review.

Thanks,
Aparna M

On 20:46-20210624, Nikhil Devshatwar wrote:
> On 20:44-20210624, Nikhil Devshatwar wrote:
> > From: Aparna M <a-m1@ti.com>
> > 
> > Update SRCREV to the latest.
> > This add a matrix application to blink LED for AM64x EVM
> > 
> > Signed-off-by: Aparna M <a-m1@ti.com>
> > Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> > ---
> 
> missed adding the branch tag
> this is applicable to both dunfell and master branch
> 
> Regards,
> Nikhil D
> 
> >  meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > index d4956903..fac1fc8d 100644
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
> > @@ -4,7 +4,7 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
> >  LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
> >  
> >  SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
> > -SRCREV = "30424117fc609beffb512450fe0d9b328d75b458"
> > +SRCREV = "976e775a1275198d3391018ce8115a66d00120a2"
> >  BRANCH = "master"
> >  INC_PR = "r76"
> >  
> > -- 
> > 2.17.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

