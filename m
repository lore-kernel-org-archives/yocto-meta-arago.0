Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id C2CA2529AF
	for <meta-arago@arago-project.org>;
	Tue,  5 Sep 2017 13:53:15 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85DrF1x032236
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 08:53:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504619595;
	bh=6lu9maxppW7dqEx+LqNVTwkoRycwIn3GdMn3dasyfPA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=mb1sf9ql72no/XVFGZ1nOH4B32u2kICTZasrvlHsDpEMilO3nUtsrx1Q8AuRfLwxK
	4Z8JbR54+1GfZZtlyRW/PgqhPlPvqTAxIlyiBqwlkfMFkja3ahnItBkDcFkdHV3+Qd
	eRfJ//HbsdpxEi3sqzMyzIWgouWOdLkgE2Z5N5oU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85DrFni032745
	for <meta-arago@arago-project.org>; Tue, 5 Sep 2017 08:53:15 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 08:53:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 08:53:15 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85DrElT022515;
	Tue, 5 Sep 2017 08:53:15 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170901211741.26451-1-manisha.agrawal@ti.com>
	<20170901211741.26451-3-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6dd39526-db2f-598b-770e-00346d66366b@ti.com>
Date: Tue, 5 Sep 2017 09:53:14 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170901211741.26451-3-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v3 3/7] matrix-gui-submenus : create hmi sub menu
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
X-List-Received-Date: Tue, 05 Sep 2017 13:53:16 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

The name of this file needs to match the name of the upstream recipe 
(i.e. matrix-gui-submenus_2.0.bbappend).


On 9/1/2017 5:17 PM, Manisha Agrawal wrote:
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-core/matrix/matrix-gui-submenus.bbappend | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>   create mode 100644 recipes-core/matrix/matrix-gui-submenus.bbappend
>
> diff --git a/recipes-core/matrix/matrix-gui-submenus.bbappend b/recipes-core/matrix/matrix-gui-submenus.bbappend
> new file mode 100644
> index 0000000..681f22e
> --- /dev/null
> +++ b/recipes-core/matrix/matrix-gui-submenus.bbappend
> @@ -0,0 +1,11 @@
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
s

