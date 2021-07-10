Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 825B6529F0
	for <meta-arago@arago-project.org>;
	Sat, 10 Jul 2021 13:15:53 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16ADFx28069199;
	Sat, 10 Jul 2021 08:15:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625922959;
	bh=zK93B/3Ckh9gGG3hCPoEIINwDf85Fw/EJFcrjeb9yoE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=EomZeH1qjPrD+iQscIAZ/YjFmwcf0E5fX1sywncqkLzclNG9PmeT1ekVJ6Q07OGRG
	Iydqk0XyLT4mJO91+BK2NAEANU63w5FlTq6LSBRX8Mrl6A0FFGpA6NQ1poqLHhiM2m
	yJHeGAfZ3hBNktb33pPTOxxzvzH3egrJ268vhO1g=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16ADFxbC003320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 10 Jul 2021 08:15:59 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Sat, 10 Jul 2021 08:15:59 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Sat, 10 Jul 2021 08:15:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16ADFxn3079775;
	Sat, 10 Jul 2021 08:15:59 -0500
Date: Sat, 10 Jul 2021 08:15:59 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <praneeth@ti.com>, <yogeshs@ti.com>
Message-ID: <20210710131559.4x7gkuhb4jutn65p@pension>
References: <20210709180401.2977-1-nm@ti.com> <20210709180401.2977-5-nm@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210709180401.2977-5-nm@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [tisdk-build-scripts PATCH 4/5] config-build-env: Make sure that the git url points correctly
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
X-List-Received-Date: Sat, 10 Jul 2021 13:15:53 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 13:04-20210709, Nishanth Menon wrote:
> Make sure that the build scripts git url points to the correct location.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
>  lib/oesdk/config-build-env | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/oesdk/config-build-env b/lib/oesdk/config-build-env
> index 885fbcfb50d9..cdfa6830eb51 100644
> --- a/lib/oesdk/config-build-env
> +++ b/lib/oesdk/config-build-env
> @@ -47,6 +47,14 @@ checkout_layer_scripts() {
>      else
>          # This looks to be a git repo.  Hopefully it is the right one :)
>          cd $BUILD_ROOT
> +	# In case we have changed the location of our build scripts
> +	# we should change our git url towards it.
> +        mygit='git remote get-url  origin'
> +        if [ "$mygit" != "$TI_SDK_OELAYER_SETUP"]; then
There needs to be a space between "$TI_SDK_OELAYER_SETUP" and ]

if there are no further comments, and you can fix it when applying,
please do. Else, do comment so that I can send an updated
version.

> +            echo "$TI_SDK_OELAYER_SETUP Mismatch in git URL: $mygit vs $TI_SDK_OELAYER_SETUP. Force resetting the origin!"
> +            git remote set-url origin $TI_SDK_OELAYER_SETUP
> +        fi
> +
>          git fetch
>          git reset --hard origin
>      fi
> -- 
> 2.32.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

