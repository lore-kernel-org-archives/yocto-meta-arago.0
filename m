Return-Path: <j-stiffler@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 5F70952978
	for <meta-arago@arago-project.org>;
	Fri,  1 Sep 2017 20:49:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v81KnXBa012372
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:49:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504298973;
	bh=OUfFTDVt8gJnhbi7Qn9W2cITMfO8zRL5FY1kt2XZQ6Y=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=c5xZ3YRvStLCF0uI7UpQu9Yasa2uGKVKzdAX7M59yK8RZBKC/A/uqIoxrHv6DWxoG
	rwTr1+JBmq65DaAT3iPP8aToE2rxloJta87GXAfwoD5SiizTCbb1DxP4zHvqSuieRW
	Tf7rEu0K4lFltGpjzS1wtbltfllxUxC4c+ukPBDo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KnSWq028787
	for <meta-arago@arago-project.org>; Fri, 1 Sep 2017 15:49:28 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 1 Sep 2017 15:49:28 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 1 Sep 2017 15:49:28 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v81KnR8O013473;
	Fri, 1 Sep 2017 15:49:27 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901203222.24972-1-manisha.agrawal@ti.com>
	<20170901203222.24972-2-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <08d67916-dc18-7ed5-3991-3429a6467a84@ti.com>
Date: Fri, 1 Sep 2017 16:49:27 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901203222.24972-2-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v2 2/7] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Fri, 01 Sep 2017 20:49:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please remove the extra blank lines at the bottom of this file.


On 9/1/2017 4:32 PM, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-core/matrix/matrix-gui-submenus.bbappend | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>   create mode 100644 recipes-core/matrix/matrix-gui-submenus.bbappend
>
> diff --git a/recipes-core/matrix/matrix-gui-submenus.bbappend b/recipes-core/matrix/matrix-gui-submenus.bbappend
> new file mode 100644
> index 0000000..e30848a
> --- /dev/null
> +++ b/recipes-core/matrix/matrix-gui-submenus.bbappend
> @@ -0,0 +1,14 @@
> +PR_append = ".tisdk2"
> +
> +SUBMENUS_append = " \
> +    hmi_submenu \
> +"
> +
> +PACKAGES_append = " \
> +    ${PN}-hmi \
> +"
> +
> +FILES_${PN}-hmi = "${MATRIX_APP_DIR}/hmi_submenu/*"
> +
> +
> +


