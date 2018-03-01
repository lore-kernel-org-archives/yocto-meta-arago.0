Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id A172F529C7
	for <meta-arago@arago-project.org>;
	Thu,  1 Mar 2018 19:15:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w21JEkPb021400
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:14:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519931686;
	bh=7pqr5psb4f/XO9cwOmsKWQfm09brRfmCjQKeLmuG5F4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=OE4tSSG8BiPd8p5AUwRfTqSvf5SHbBuFXVKXrmWkmZ7pFzyszpdVEirmJc5SNFO+0
	TjXfG1JYWuG2JqFdNuMvaZuw/7hI4R//2tXnVXSZrtyP1MSDrolFEAm5nd/E9tYwX/
	nZPSg4yPDQqOPpKGy6zkA1vwclkGuje6XvmRrjGI=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JEk3k020692
	for <meta-arago@arago-project.org>; Thu, 1 Mar 2018 13:14:46 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Thu, 1 Mar 2018 13:14:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Thu, 1 Mar 2018 13:14:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w21JEkYl019082;
	Thu, 1 Mar 2018 13:14:46 -0600
Date: Thu, 1 Mar 2018 14:14:45 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>
Message-ID: <20180301191445.GO22424@edge>
References: <1519924373-4999-1-git-send-email-x0157990@ti.com>
	<20180301185615.GL22424@edge>
	<6be3d52ef55c43cbbd0070792708d988@ti.com>
MIME-Version: 1.0
In-Reply-To: <6be3d52ef55c43cbbd0070792708d988@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] tiovx-app: Fix memory map for DSP firmware
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
X-List-Received-Date: Thu, 01 Mar 2018 19:15:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, have you tried this patch on meta-arago? The path is wrong, there's no 
tiovx and my question was whether tiovx itself will be upstreamed or not.

-- 
Denys


On Thu, Mar 01, 2018 at 02:11:54PM -0500, Senicic, Djordje wrote:
>    Earlier I sent one for meta-processor-sdk.
>    This is the same one for meta-arago (I think you asked if we are going to
>    upstream).
> 
>    -----Original Message-----
>    From: Dmytriyenko, Denys
>    Sent: Thursday, March 01, 2018 1:56 PM
>    To: Senicic, Djordje
>    Cc: meta-arago@arago-project.org; Senicic, Djordje
>    Subject: Re: [meta-arago] [PATCH] tiovx-app: Fix memory map for DSP
>    firmware
> 
>    Is this for processor-sdk layer?
> 
>    On Thu, Mar 01, 2018 at 12:12:53PM -0500, Djordje Senicic wrote:
>    > Signed-off-by: Djordje Senicic <x0157990@ti.com>
>    > ---
>    >  recipes-ti/tiovx/tiovx-sys.inc | 2 +-
>    >  1 file changed, 1 insertion(+), 1 deletion(-)
>    >
>    > diff --git a/recipes-ti/tiovx/tiovx-sys.inc
>    > b/recipes-ti/tiovx/tiovx-sys.inc index fc24947..43c4e1d 100644
>    > --- a/recipes-ti/tiovx/tiovx-sys.inc
>    > +++ b/recipes-ti/tiovx/tiovx-sys.inc
>    > @@ -1,5 +1,5 @@
>    >  PV = "01.00.00.00"
>    > 
>    >  BRANCH="master"
>    > -SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
>    > +SRCREV = "375fa639773970e433171686f01f360a9a5b2ad4"
>    >  SRC_URI =
>    "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
>    > --
>    > 1.9.1
>    >
>    > _______________________________________________
>    > meta-arago mailing list
>    > meta-arago@arago-project.org
>    > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

