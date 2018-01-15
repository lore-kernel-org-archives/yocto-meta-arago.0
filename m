Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id ACC3D52A28
	for <meta-arago@arago-project.org>;
	Mon, 15 Jan 2018 23:52:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w0FNqQLs015116
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:52:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1516060346;
	bh=jYrO7jhfuBPpaNhSLZYjikoadU95bXRsiYcakuDsbvk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OdJ9134FYbZw4i1nQci4RYLINRB985yhiOckZLZW6LyCfXytcmJGtt28NLGYY0oYN
	9G9Wp/JFZJNUpc/o8DVOoJ1mhhiaBrmvc39yFY1iWvcpL8rpT3yE05gVP+Cu98MceD
	XLmsk+E7k4WSId+O/LzMOUKNItdlQ04e+yM+Bfw0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNqQ3w006075
	for <meta-arago@arago-project.org>; Mon, 15 Jan 2018 17:52:26 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 15 Jan 2018 17:52:25 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 15 Jan 2018 17:52:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w0FNqPh4024609;
	Mon, 15 Jan 2018 17:52:25 -0600
Date: Mon, 15 Jan 2018 18:52:25 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Gou, Hongmei" <h-gou@ti.com>
Message-ID: <20180115235224.GC31682@edge>
References: <1516058569-7239-1-git-send-email-a0271529@ti.com>
	<20180115232504.GB31682@edge>
	<f52ea77d0c044d5fb021a8686d221bd7@ti.com>
MIME-Version: 1.0
In-Reply-To: <f52ea77d0c044d5fb021a8686d221bd7@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [meta-processor-sdk] branding-processor-sdk: bump max_leb_cnt for k2hk
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
X-List-Received-Date: Mon, 15 Jan 2018 23:52:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jan 15, 2018 at 06:34:27PM -0500, Gou, Hongmei wrote:
>    > -----Original Message-----
>    > From: Dmytriyenko, Denys
>    > Sent: Monday, January 15, 2018 6:25 PM
>    > To: Gou, Hongmei
>    > Cc: meta-arago@arago-project.org
>    > Subject: Re: [meta-arago] [meta-processor-sdk] branding-processor-sdk:
>    > bump max_leb_cnt for k2hk
>    >
>    > On Mon, Jan 15, 2018 at 06:22:49PM -0500, Hongmei Gou wrote:
>    > > Signed-off-by: Hongmei Gou <a0271529@ti.com>
>    > > ---
>    > >  conf/distro/include/branding-processor-sdk.inc | 2 +-
>    > >  1 file changed, 1 insertion(+), 1 deletion(-)
>    > >
>    > > diff --git a/conf/distro/include/branding-processor-sdk.inc
>    > > b/conf/distro/include/branding-processor-sdk.inc
>    > > index 955606f..2fbcb04 100644
>    > > --- a/conf/distro/include/branding-processor-sdk.inc
>    > > +++ b/conf/distro/include/branding-processor-sdk.inc
>    > > @@ -43,7 +43,7 @@ MKUBIFS_ARGS_am57xx-evm     = "-F -m 2048 -e
>    > 126976 -c 15000"
>    > >  MKUBIFS_ARGS_am57xx-hs-evm  = "-F -m 2048 -e 126976 -c 15000"
>    > >  MKUBIFS_ARGS_dra7xx-evm     = "-F -m 2048 -e 126976 -c 15000"
>    > >  MKUBIFS_ARGS_dra7xx-hs-evm  = "-F -m 2048 -e 126976 -c 15000"
>    > > -MKUBIFS_ARGS_k2hk           = "-F -m 2048 -e 126976 -c 4100"
>    > > +MKUBIFS_ARGS_k2hk           = "-F -m 2048 -e 126976 -c 4200"
>    >
>    > Would it fit into flash?
> 
>    Not sure what would be the maximal to use to fit into flash.
>    Below is reported from the nightly builds for K2HK in processor SDK:
>    Non-RT: max_leb_cnt too low (4120 needed)
>    RT: max_leb_cnt too low (4118 needed)
>    HS: max_leb_cnt too low (4130 needed)

Yes, I know. It has been known for some time. It's at the max size already.

Increasing size will fix the build, but render images unusable, as they don't 
fit anymore.


>    > >  # By default, do not include OPTEE for any HS platform  # Comment the
>    > > OPTEEMACHINE and OPTEEFLAVOR line for a
>    > > --
>    > > 1.9.1
>    > >
>    > > _______________________________________________
>    > > meta-arago mailing list
>    > > meta-arago@arago-project.org
>    > > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

