Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 9B72352976
	for <meta-arago@arago-project.org>;
	Tue, 27 Feb 2018 19:21:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w1RJKVgr015320
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 13:20:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1519759231;
	bh=KJjusv0x46VIOiU8S3qfUULeiwKQrV6G+GTqqD6U/W4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=bgpgZm3b/GY6h969/7+dSLk7e8qQr04JgsKisxKjByj2/8jO8gKUA/EWh/w7wiy4b
	sLvmAzdVeSwoAbzzSLxKbcrzbYcRWOf+euPAv9VNyy6hCzsyYWNEODisweizbsNI7V
	GjZICTNZZkJiJ6iXbp79e7esLvM+Wq+qGb5CPzF0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RJKVBo028556
	for <meta-arago@arago-project.org>; Tue, 27 Feb 2018 13:20:31 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Feb 2018 13:20:30 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Feb 2018 13:20:30 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w1RJKUao027213;
	Tue, 27 Feb 2018 13:20:30 -0600
Date: Tue, 27 Feb 2018 14:20:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180227192029.GN12117@edge>
References: <1519757440-25574-1-git-send-email-x0157990@ti.com>
	<8636d323-2d05-f34c-74dd-73d6a3bca223@ti.com>
MIME-Version: 1.0
In-Reply-To: <8636d323-2d05-f34c-74dd-73d6a3bca223@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, d-senicic1@ti.com,
	Djordje Senicic <x0157990@ti.com>
Subject: Re: [EXTERNAL] [meta-processor-sdk] [PATCH] tiovx-app: Fix memory map for DSP firmware
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
X-List-Received-Date: Tue, 27 Feb 2018 19:21:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Why is this not upstreamed?

On Tue, Feb 27, 2018 at 01:58:07PM -0500, Jacob Stiffler wrote:
> Thank you. This has been pushed.
> 
> 
> On 2/27/2018 1:50 PM, Djordje Senicic wrote:
> >Signed-off-by: Djordje Senicic <x0157990@ti.com>
> >---
> >  recipes-ti/tiovx/tiovx-sys.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/recipes-ti/tiovx/tiovx-sys.inc b/recipes-ti/tiovx/tiovx-sys.inc
> >index fc24947..43c4e1d 100644
> >--- a/recipes-ti/tiovx/tiovx-sys.inc
> >+++ b/recipes-ti/tiovx/tiovx-sys.inc
> >@@ -1,5 +1,5 @@
> >  PV = "01.00.00.00"
> >  BRANCH="master"
> >-SRCREV = "c208217c5c3788c78d10ff0d25e5db9782e00be9"
> >+SRCREV = "375fa639773970e433171686f01f360a9a5b2ad4"
> >  SRC_URI = "git://git.ti.com/processor-sdk/tiovx-app.git;protocol=git;branch=${BRANCH}"
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

