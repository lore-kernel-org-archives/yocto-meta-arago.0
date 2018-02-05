Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 4A6B552986
	for <meta-arago@arago-project.org>;
	Mon,  5 Feb 2018 21:35:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w15LZn4l015585
	for <meta-arago@arago-project.org>; Mon, 5 Feb 2018 15:35:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1517866549;
	bh=mMggdObzik55rwyhPuzWb2VZx1RPJotINvim4kItXp0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=B6D2ID2Jwu2n57IFQtjYWc4CR+a9vu+d96LH2p5V4gj9j13jyN42fZXE2Irs7RYqM
	ZKONEeXAb6VBs9WDktxK5yfD/+IOFMzJFgNxrmlVFn9EOfJSMeDW9TP8X3Arfwybq2
	UtgpOaSpOTCMVMa3UlX8O7TzY3Mq3F/J4DsM++V8=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w15LZnJP005226
	for <meta-arago@arago-project.org>; Mon, 5 Feb 2018 15:35:49 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Feb 2018 15:35:49 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Feb 2018 15:35:48 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w15LZmXN014216;
	Mon, 5 Feb 2018 15:35:48 -0600
Date: Mon, 5 Feb 2018 16:35:48 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Gaurav Mitra <gaurav@ti.com>
Message-ID: <20180205213548.GA25146@edge>
References: <20180205213019.82013-1-gaurav@ti.com>
MIME-Version: 1.0
In-Reply-To: <20180205213019.82013-1-gaurav@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [meta-processor-sdk] ocl: trigger opencl-examples rebuild when opencl-monitor changes
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
X-List-Received-Date: Mon, 05 Feb 2018 21:35:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 05, 2018 at 03:30:19PM -0600, Gaurav Mitra wrote:
> Signed-off-by: Gaurav Mitra <gaurav@ti.com>
> ---
>  recipes-ti/ocl/opencl-examples_git.bbappend | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/recipes-ti/ocl/opencl-examples_git.bbappend b/recipes-ti/ocl/opencl-examples_git.bbappend
> index 4df65c2..b78b10c 100644
> --- a/recipes-ti/ocl/opencl-examples_git.bbappend
> +++ b/recipes-ti/ocl/opencl-examples_git.bbappend
> @@ -1 +1,4 @@
>  require ocl-1.1.14.inc
> +
> +PR_append = ".tisdk0"
> +DEPENDS += " opencl-monitor"

Isn't it already in the DEPENDS list? Line #13:

http://arago-project.org/git/?p=meta-arago.git;a=blob;f=meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb;hb=refs/heads/morty#l13


> -- 
> 2.14.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

