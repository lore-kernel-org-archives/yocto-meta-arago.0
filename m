Return-Path: <denys@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id CC42D52AC0
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 17:20:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7THKskR014048
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504027254;
	bh=xG6vIcPeIj7t8XkTQ2IjT7M9FrDnH7w1hrxGHjR7VRM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=f4NnmO7EVhSP7TQWsC5CqUpajQc5/WzyP6SOLh3g7FuL6NV6bA+Xj8j4z7Zlpaj5H
	Vv+/lk15wA40pv5+4clFVREDpTqxUJP7LH5HaZM8PmSTx1AzYos10/zskNImcUcm4b
	nyhEw1VkDfBF4PgboBWEFkub+3dIr2re6XQLU+Ic=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THKsER030995
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 12:20:54 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 29 Aug 2017 12:20:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 29 Aug 2017 12:20:54 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7THKsla003543;
	Tue, 29 Aug 2017 12:20:54 -0500
Date: Tue, 29 Aug 2017 13:20:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Manisha Agrawal <manisha.agrawal@ti.com>
Message-ID: <20170829172049.GF8304@edge>
References: <20170829163826.15777-1-manisha.agrawal@ti.com>
	<20170829163826.15777-3-manisha.agrawal@ti.com>
MIME-Version: 1.0
In-Reply-To: <20170829163826.15777-3-manisha.agrawal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty][PATCH v2 3/6] meta-arago-extras : matrix : recipe for evse hmi
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
X-List-Received-Date: Tue, 29 Aug 2017 17:20:55 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

> meta-arago-extras : matrix : recipe for evse hmi

> matrix-gui-hmi-demos: hmi demo descriptions for matrix


> Recipe to enable adding the evse-hmi demo to the matrix launcher

This is redundant if the above subject is used.


> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>  .../matrix/matrix-gui-hmi-demos_2.0.bb             | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
> new file mode 100755
> index 0000000..36eaebc
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
> @@ -0,0 +1,26 @@
> +DESCRIPTION = "HMI demo descriptions for Matrix v2"

SUMMARY.


> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps"
> +
> +require recipes-core/matrix/matrix-gui-apps-git.inc
> +
> +PR = "${INC_PR}.0"
> +
> +inherit allarch
> +
> +S = "${WORKDIR}/git/hmi_apps"
> +
> +# Make sure machinevision submenu and app images has been installed
> +HMI_RDEPENDS += "matrix-gui-apps-images matrix-gui-submenus-hmi"
> +
> +FILES_${PN} += "${MATRIX_BASE_DIR}/*"
> +
> +PACKAGES = "matrix-hmi-demo-evse \
> +"
> +
> +RDEPENDS_matrix-hmi-demo-evse = " \
> +    ${HMI_RDEPENDS} \
> +    evse-hmi \
> +"
> +
> +FILES_matrix-hmi-demo-evse    = "${MATRIX_APP_DIR}/hmi-evse/*"
> +FILES_matrix-hmi-demo-evse  += "${bindir}/runHmiEvse.sh"
> -- 
> 2.13.0
> 

