Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 00D215298A
	for <meta-arago@arago-project.org>;
	Tue, 13 Aug 2019 23:51:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7DNp1Y2095636
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 18:51:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565740261;
	bh=j/jfFrs82WPEbPU4VSU0hPom22OYxLelJq6fHXrKaSQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=IptlXnSaEmZhRYZrb2mXZQZBn+zy4e9m5l7o0J3jRi7iD2nr7dYV8x8WVUlowbSmZ
	3Qa2EHBGImfsfXrvDhm3jMXy4k3OmlujD2JajemyvKIeTgiLjUUt7YNsPMqnK4kMni
	wCzsjsB8tWgbPKCbEPjd9abL8h7LAqOfwHWT5oqU=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7DNp1GY011867
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 13 Aug 2019 18:51:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 13 Aug 2019 18:51:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 13 Aug 2019 18:51:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7DNp0wG084281;
	Tue, 13 Aug 2019 18:51:00 -0500
Date: Tue, 13 Aug 2019 19:51:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jianzhong Xu <xuj@ti.com>
Message-ID: <20190813235100.GI7130@beryl>
References: <20190809194048.63206-1-xuj@ti.com>
MIME-Version: 1.0
In-Reply-To: <20190809194048.63206-1-xuj@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Tue, 13 Aug 2019 23:51:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

This update fails on am65x. Does it require armnn changes? If so, should be in 
the series, not 2 separate patches.


On Fri, Aug 09, 2019 at 03:40:48PM -0400, Jianzhong Xu wrote:
> * tidl import tool fixes for non-square padding and Caffe data layer format
> 
> Signed-off-by: Jianzhong Xu <xuj@ti.com>
> ---
>  meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> index 2c29fc27..6fdeec48 100644
> --- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> +++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
> @@ -1,6 +1,6 @@
>  SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
> -SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
> +SRCREV = "b2466e02f99d85d8afcbc93edc612da5cc9345de"
>  
> -PV = "01.01.01.00"
> +PV = "01.01.02.00"
>  PR = "r0"
>  
> -- 
> 2.17.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

