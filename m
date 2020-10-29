Return-Path: <nikhil.nd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CA4D4520EA
	for <meta-arago@arago-project.org>;
	Thu, 29 Oct 2020 16:42:10 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TGd4lr028036;
	Thu, 29 Oct 2020 11:39:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603989544;
	bh=9LUGit0a+zI1WIWwkwREjBjRwmARTWs3rhXhGFVcCVw=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gKGdj6wUhrGiBbQhmsq7djTrm2o/4jR8iOfmB70c6SQ+0gSUe2nLQxnV9jPduAj7L
	c1uMWDknNdUxJe2VA92/+282eUZEfgctm9tDN2Xk+ZRe3JaWigtr6YRkDDjr5KRt1O
	2p9KP3kkppW3rVxek1F0CUqy7H8N7uUsZ7x3ZUY8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TGd3lZ023612
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 11:39:04 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 29 Oct 2020 11:39:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 29 Oct 2020 11:39:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TGd2nw043328;
	Thu, 29 Oct 2020 11:39:03 -0500
Date: Thu, 29 Oct 2020 22:09:01 +0530
From: Nikhil Devshatwar <nikhil.nd@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20201029163901.fhuq3a7pnbjngy4i@NiksLab>
References: <1603927657-53672-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1603927657-53672-1-git-send-email-denis@denix.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Thu, 29 Oct 2020 16:42:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:27-20201028, Denys Dmytriyenko wrote:
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

Thank you.
Tested-by: Nikhil Devshatwar <nikhil.nd@ti.com>

with am65xx-evm and dra7xx-evm

> 
>  .../recipes-devtools/websocketd/websocketd_0.3.1.bb    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
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
> -- 
> 2.7.4
> 

