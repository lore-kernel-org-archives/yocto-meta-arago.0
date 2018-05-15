Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id AB1BD5298C
	for <meta-arago@arago-project.org>;
	Tue, 15 May 2018 18:48:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w4FIm4VA029391
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 13:48:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1526410084;
	bh=P9IEUy+iQapPEAsjZlGMdODJYpKpC62x52FFyV1yiF0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=UrNIK+jiKyd7dK0u/qPHtrUHiVB5aLwTZCKYdWc2hZXwHQt3sxM94VSI9Skvjg3xT
	OHb6SSv5fj/1tXrI/uUvEs4rS+04GxmG9TwwLYrEKo/+BjaKZWtbtgDKzMV2+8A8PX
	WSDbByJHgQd0Uoe/SxjF0NuGCyiKEosffhilPvaI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FIm4Ss024312
	for <meta-arago@arago-project.org>; Tue, 15 May 2018 13:48:04 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 15 May 2018 13:48:03 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 15 May 2018 13:48:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w4FIm3eb028013;
	Tue, 15 May 2018 13:48:03 -0500
Date: Tue, 15 May 2018 14:48:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Chengalvala, Vivek" <vchengalvala@ti.com>
Message-ID: <20180515184802.GF4099@edge>
References: <1525379171-19544-1-git-send-email-denys@ti.com>
	<1525379171-19544-2-git-send-email-denys@ti.com>
	<dce529ac60f147ae9fdd6f1f1d159e7e@ti.com>
MIME-Version: 1.0
In-Reply-To: <dce529ac60f147ae9fdd6f1f1d159e7e@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Karicheri, 
	Muralidharan" <m-karicheri2@ti.com>
Subject: Re: [EXTERNAL] [rocko/master][PATCH 2/2] packagegroup-*-base-tisdk: switch back from iperf3 to iperf2
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
X-List-Received-Date: Tue, 15 May 2018 18:48:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Vivek,

I was trying to avoid having both versions in the rootfs. Can you install the 
second one from IPK?

-- 
Denys


On Tue, May 15, 2018 at 02:44:45PM -0400, Chengalvala, Vivek wrote:
> Denys,
> 
> Can we have both iperf2 and iperf3? With iperf3, we see that packet 
> loss/re-ordering stats are better accounted.
> 
> Regards,
> Vivek
> 
> -----Original Message-----
> From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago-project.org] On Behalf Of Dmytriyenko, Denys
> Sent: Thursday, May 03, 2018 4:26 PM
> To: meta-arago@arago-project.org
> Subject: [EXTERNAL] [meta-arago] [rocko/master][PATCH 2/2] packagegroup-*-base-tisdk: switch back from iperf3 to iperf2
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> index 8238b1b..7a59fea 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk.bb
> @@ -1,6 +1,6 @@
>  DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
>  LICENSE = "MIT"
> -PR = "r19"
> +PR = "r20"
>  
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
> @@ -19,7 +19,7 @@ RDEPENDS_${PN} = "\
>      libxml2 \
>      libpcre \
>      iptables \
> -    iperf3 \
> +    iperf \
>      arago-gpl-notice \
>      arago-feed-config \
>      nfs-utils-client \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

