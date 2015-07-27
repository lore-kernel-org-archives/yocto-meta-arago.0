Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id B2C7A52991
	for <meta-arago@arago-project.org>;
	Mon, 27 Jul 2015 13:55:40 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t6RDtd9Y014568
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 08:55:39 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RDtdBJ018157
	for <meta-arago@arago-project.org>; Mon, 27 Jul 2015 08:55:39 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Jul 2015 08:55:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t6RDtdfJ010445;
	Mon, 27 Jul 2015 08:55:39 -0500
Date: Mon, 27 Jul 2015 09:55:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20150727135523.GE1040@edge>
References: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
	<E60A9E1B4132A24DB80BD56ABC92684735043FCF@DBDE04.ent.ti.com>
	<54C90AFB.9050302@ti.com> <20150724175601.GG1089@denix.org>
	<55B61B13.3090607@ti.com>
MIME-Version: 1.0
In-Reply-To: <55B61B13.3090607@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests packages
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
X-List-Received-Date: Mon, 27 Jul 2015 13:55:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 27, 2015 at 05:20:43PM +0530, Karthik Ramanan wrote:
> On 24-Jul-15 11:26 PM, Denys Dmytriyenko wrote:
> >Karthik, Nikhil,
> >
> >This split was done back in January, but now it causes a conflict, because
> >both vpdma-fw and vpe-tests try to install the same firmware image. Do you
> >know if vpe-tests Makefile needs to be updated to not install FW image, or we
> >can do it in the recipe itself. How do you want to handle this?
> >
> 
> Denys,
> 
> Can you please give some more details about the issue?
> I just checked this on the latest nightly from GLSDK and I can see
> both vpdma-fw and vpe-tests included. We don't see the issue.

You should get a warning that both packages install vpdma-1b8.bin into 
/lib/firmware/ It wasn't fatal back in daisy.

-- 
Denys

