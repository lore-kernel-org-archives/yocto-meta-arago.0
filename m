Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id F11C9529D3
	for <meta-arago@arago-project.org>;
	Tue, 12 Sep 2017 02:25:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8C2PRPc000856
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:25:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505183127;
	bh=wEHNn5t+MY9uFYIMGlGTWZ/9O3nh9+VmiB2OTVafaus=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=G15n7I8uIXuStvCiVTDA3M1UFtfp5hZFux4U+UzTi0A/fA10LAr6GKK4lLmiD8Ppp
	zYe8+l5A682wR7435z/CuDQLs023WOWERFspTmdXJ15q/qC1j6Nq0T7aVULS66GwDC
	uoLJR1mt5esJmRPzY33PaOJAgY2eYDIYqg2Yk2Do=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8C2PRtg012082
	for <meta-arago@arago-project.org>; Mon, 11 Sep 2017 21:25:27 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 11 Sep 2017 21:25:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 11 Sep 2017 21:25:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8C2PRrU027792;
	Mon, 11 Sep 2017 21:25:27 -0500
Date: Mon, 11 Sep 2017 22:25:22 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170912022522.GS8304@edge>
References: <20170901205107.25462-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170901205107.25462-1-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v1 1/6] protectio-relays-hmi : new demo
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
X-List-Received-Date: Tue, 12 Sep 2017 02:25:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I normally do not complain about typos too much, but there are too many of 
them here...

> Subject: [PATCH v1 1/6] protectio-relays-hmi : new demo

"protectio"


> This demo is developed as part of TI Design on Protection Relaysi HMI.

"Relaysi"


> A protection relay is a smart device that receives inputs, compares
> them to set points, and provides outputs. Inputs can be current,
> voltage, resistance, or temperature. Outputs can include visual
> feedback in the form of indicator lights and/or an alphanumeric
> display, communications, control warnings, alarms, and turning
> power off and on
> 
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../protection-relays-hmi_git.bb                     | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> 
> diff --git a/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> new file mode 100755
> index 00000000..71f1ea5d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-apps/protection-relays-hmi/protection-relays-hmi_git.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "HMI demo for Prectection Relays using QT QWidget tools"

"Prectection"


> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=33;md5=a9cde3921a8be42ed79ab74661799104"
> +
> +inherit qt-provider
> +
> +PV = "1.0"
> +PR = "r0"
> +
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/sitara-linux/protection-relays-hmi.git;protocol=git;branch=${BRANCH}"
> +
> +SRCREV = "c8764aaba365302090179b6720cbfc994e169842"
> +
> +S = "${WORKDIR}/git"
> +
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -m 755 protection_relays_hmi ${D}${bindir}
> +}
> -- 
> 2.13.0
> 

