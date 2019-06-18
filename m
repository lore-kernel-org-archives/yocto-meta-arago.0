Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0E21C52998
	for <meta-arago@arago-project.org>;
	Tue, 18 Jun 2019 12:37:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5ICaqfO085240
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:36:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560861412;
	bh=RMbEGrIwId1DcdZRVGoZL/VnLdCi4P+9VwBAq0UF7XI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=aqqxBaGnPE6riHFronKJUPfbhu965Y5NJQGsTEyiFI+LUXahSfK5tRBhGArhmmAli
	7F/0o8jGfKPG9H8c5pN5MMioHJlIxoJsEkh2mqs07HwUWPWPyIGvh4Kt9yf9YJwZCH
	uOgiYB4wFKg58bE4wlxl+UQOEzDAtcw2jeIAblH8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5ICaqkZ075905
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:36:52 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 18 Jun 2019 07:36:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 18 Jun 2019 07:36:52 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5ICaqGg119263
	for <meta-arago@arago-project.org>; Tue, 18 Jun 2019 07:36:52 -0500
To: <meta-arago@arago-project.org>
References: <1560792109-26034-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <c2ab2139-6846-8a67-09f8-3c83207f9fb2@ti.com>
Date: Tue, 18 Jun 2019 08:36:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1560792109-26034-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [master/thud/ti2019.01][PATCH] matrix-gui-crypto-demos: configure to use openssl 1.0
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
X-List-Received-Date: Tue, 18 Jun 2019 12:37:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please back-port this to ti2019.01.


Thank you,

Jake

On 6/17/2019 1:21 PM, Jacob Stiffler wrote:
> The openssl_perf.sh script requires HW offloading, so use openssl 1.0
> which supports it.
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb       | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> index 02a4f46..99cf9c9 100644
> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
>   
>   require matrix-gui-apps-git.inc
>   
> -PR = "${INC_PR}.11"
> +PR = "${INC_PR}.12"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   
> @@ -13,10 +13,16 @@ S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
>   S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
>   S_keystone = "${WORKDIR}/git/cryptos_apps_program"
>   
> +# These scripts HW offloading, so use openssl 1.0
> +OPENSSL_BIN = "/usr/bin/openssl10"
> +do_configure() {
> +    sed -i -e "s|^OPENSSL=.*|OPENSSL=${OPENSSL_BIN}|" ${S}/openssl_perf_scripts/openssl_perf.sh
> +}
> +
>   FILES_${PN} += "${MATRIX_BASE_DIR}/*"
>   
> -# Make sure crypto submenu and app images has been installed. Also make sure openssl is available
> -RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
> +# Make sure crypto submenu and app images has been installed. Also make sure openssl10 is available
> +RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl10 matrix-gui-helper-scripts"
>   
>   RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
>   RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"

