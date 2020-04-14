Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EFFFD529FC
	for <meta-arago@arago-project.org>;
	Tue, 14 Apr 2020 16:11:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03EG92gw022818
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2020 11:09:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586880542;
	bh=WwM0xrFg7KXC5iQOjkzWkaOK6mb57q2n6zQLEBWDHw8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=dQWP2kLXzfNzUFiEltOrVBLOusyB9SyXKP0XSqOFHyI+j6DKS2RSO8YWLRFk8FD0j
	asbTaDJJtJREkndnLBpNs0UjxJB4LJZja4FSMe+UL0rMumU50JY/eaeMxX34HzowwD
	lXEN2W8gijt2NBn3r90d64y40bT0lXcCTsaoBXzg=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03EG924o119394
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2020 11:09:02 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 14 Apr 2020 11:09:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 14 Apr 2020 11:09:01 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03EG91m6016418
	for <meta-arago@arago-project.org>; Tue, 14 Apr 2020 11:09:01 -0500
To: <meta-arago@arago-project.org>
References: <1585847393-14558-1-git-send-email-j-stiffler@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0655a061-30b2-697a-76bb-01952a269a80@ti.com>
Date: Tue, 14 Apr 2020 12:09:01 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1585847393-14558-1-git-send-email-j-stiffler@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [zeus/master[PATCH] meta-toolchain-arago: toolchain_env_script: append subscripts
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
X-List-Received-Date: Tue, 14 Apr 2020 16:11:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Ping.

On 4/2/2020 1:09 PM, Jacob Stiffler wrote:
> * Append environment subscripts to devkit environment
> * This allows cmake projects to build against the devkit without
>    further configuration.
> * Borrowed from oe-core's toolchain-scripts.bbclass
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   .../recipes-core/meta/meta-toolchain-arago.bb           | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
>
> diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> index 065531e..1a082ba 100644
> --- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> +++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
> @@ -69,6 +69,23 @@ toolchain_create_sdk_env_script () {
>   	echo 'export OECORE_ACLOCAL_OPTS="-I $SDK_PATH_NATIVE/usr/share/aclocal"' >> $script
>   	echo 'export OECORE_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
>   	echo 'export OECORE_SDK_VERSION="${SDK_VERSION}"' >> $script
> +
> +        # Borrowed from oe-core/meta/classes/toolchain-scripts.bbclass
> +	cat >> $script <<EOF
> +
> +# Append environment subscripts
> +if [ -d "\$OECORE_TARGET_SYSROOT/environment-setup.d" ]; then
> +    for envfile in \$OECORE_TARGET_SYSROOT/environment-setup.d/*.sh; do
> +	    . \$envfile
> +    done
> +fi
> +if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d" ]; then
> +    for envfile in \$OECORE_NATIVE_SYSROOT/environment-setup.d/*.sh; do
> +	    . \$envfile
> +    done
> +fi
> +EOF
> +
>   }
>   
>   SDK_POSTPROCESS_COMMAND_prepend = "arago_sdk_fixup; "

