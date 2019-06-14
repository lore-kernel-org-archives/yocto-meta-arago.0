Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1D3F2520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 18:00:04 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EHxOgb004073
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560535164;
	bh=Wa8k4BRtSD6/aiAndGn5XObmBRZpF3YvfyrrrRlfL60=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jNAI5a5fDBqLzt7biQu47+Ay5xDC+7u/J6RS0AC/hkJf4d0QDMGq5eyD/Agb4Pk3c
	G/mjrJfm2EOld9TTytQfgwdnxBpxUklMgo6faywQGYf5VPHVvW7VC/yduwUGdQIGM4
	WyAfwqTwAKh3wzJAVPYPPpq192ayzrc2xTDKeRhI=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EHxN25048805
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:59:24 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 12:59:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 12:59:23 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EHxNK3073275
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:59:23 -0500
To: <meta-arago@arago-project.org>
References: <1560519585-14850-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <dc3c2d97-8d49-07f0-8a91-285b6d7b7471@ti.com>
Date: Fri, 14 Jun 2019 13:59:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560519585-14850-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.01][PATCH] point-cloud-viewer: remove glfw from RDEPENDS
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
X-List-Received-Date: Fri, 14 Jun 2019 18:00:04 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.01?


Thank you,

Jake


On 6/14/2019 9:39 AM, Jacob Stiffler wrote:
> The glfw package does not exist as the glfw recipe only provides a
> static library and headers. And because it is a static library that is
> provided, there is no run-time dependency.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb         | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> index 067ead9..c448f50 100644
> --- a/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> +++ b/meta-arago-extras/recipes-apps/point-cloud-viewer/point-cloud-viewer_git.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://git.ti.com/processor-sdk/point-cloud-viewer/"
>   LICENSE = "TI-TSPA"
>   LIC_FILES_CHKSUM := "file://PointCloudViewer_manifest.html;md5=7ea694db2dd8d82fd91a18cab8c2c2db"
>   
> -PR = "r1"
> +PR = "r2"
>   
>   COMPATIBLE_MACHINE = "dra7xx"
>   
> @@ -17,7 +17,7 @@ PV = "2.1"
>   
>   S = "${WORKDIR}/git"
>   
> -RDEPENDS_${PN} = "glfw opencv libxkbcommon"
> +RDEPENDS_${PN} = "opencv libxkbcommon"
>   
>   do_install() {
>       install -d ${D}${bindir}

