Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BDE46520EA
	for <meta-arago@arago-project.org>;
	Thu, 29 Oct 2020 16:39:53 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TGakv7027242;
	Thu, 29 Oct 2020 11:36:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603989406;
	bh=jrTR4A9MDZPoA+BNqyNGDQUkbaSkn3KxIs75vXIZKEA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=Qmiu7++hB4uVNameoNmzYvr/fWwaCtG+lF/AaoiLd4B7u3kzK8pivOGmMKPSOw1ZO
	5KMD54a0U9oxK0O52p3Pbt4WdiXwBaR+IGPIfzPiprRYggBVJNowj53grPPlmchBmt
	OBOD8acdqRj7gzn2OYxhdQHf7hlZAf4jKiGBohWg=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TGakrB033802
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 11:36:46 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 29 Oct 2020 11:36:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 29 Oct 2020 11:36:46 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TGaj1P084260;
	Thu, 29 Oct 2020 11:36:45 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1603927657-53672-1-git-send-email-denis@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b33249a6-81c7-e308-b609-4e939bb5a8d3@ti.com>
Date: Thu, 29 Oct 2020 11:36:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1603927657-53672-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master][PATCH v4] websocketd: Add new recipe
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
X-List-Received-Date: Thu, 29 Oct 2020 16:39:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nikhil

On 10/28/20 6:27 PM, Denys Dmytriyenko wrote:
> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>
> websocketd is an application which allows to redirect output of
> command line applications via a websocket so that web pages can
> interact with them.
>
> This is very useful for visualizing statistics information on
> host machine browser.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
> v4 - export http_proxy with explanation
>
>   .../recipes-devtools/websocketd/websocketd_0.3.1.bb    | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>   create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
>
> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
> new file mode 100644
> index 0000000..d2f3387
> --- /dev/null
> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
> @@ -0,0 +1,18 @@
> +SUMMARY = "Application for routing native applications via websockets"
> +HOMEPAGE = "http://websocketd.com/"
> +LICENSE = "BSD-2-Clause"
> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> +
> +inherit go-mod
> +
> +GO_IMPORT = "github.com/joewalnes/websocketd"
> +
> +SRC_URI = "git://${GO_IMPORT}"
> +SRCREV = "0440211d7862dc76b5f2499d7dfcd4ef6a9c2fa2"
> +
> +# bitbake only exports proxy variables during fetching, but go handles
> +# module fetching on its own during compile and needs proxy settings
> +export http_proxy
> +
> +# Development package contains all the examples in different languages
> +INSANE_SKIP_${PN}-dev = "file-rdeps"

This looks fine to me but I think we should add the version we are 
checking out.

I mean this repo has not been updated in years but we should add the 
version so we know it is v0.3.1.

Dan


