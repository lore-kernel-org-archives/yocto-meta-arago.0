Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7E05652998
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 18:42:56 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JIgEkA075364
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:42:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560969734;
	bh=/XjUtP+0kF1NwnzFiCGPwxXzcFIMij49Y+Rr0ipU7F8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=YZEcljH9ic4oRJaLNfyrEOuvgPCJn4cLjVfsMN7wKpsIcr/zMucebvvmWSkLM0T8W
	9vfEe15znd12UTmXVQ8IOUvwKQXXJkVNpI6wp+eoy/3ZHFtXJrz7Vb/UwBvfaa7+Ds
	8QJO+4y1d9Lg1iMVR6VYHUc26M/KqLI63QczwAC4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JIgEEh011170
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 13:42:14 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 13:42:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 13:42:14 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JIgEpL106961;
	Wed, 19 Jun 2019 13:42:14 -0500
Date: Wed, 19 Jun 2019 14:42:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <20190619184214.GK32001@beryl>
References: <1560958508-141402-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
In-Reply-To: <1560958508-141402-1-git-send-email-anandb@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [[thud] PATCH] arago-prefs: specify GLES providers for J7 EVM
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
X-List-Received-Date: Wed, 19 Jun 2019 18:42:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 19, 2019 at 09:05:04PM +0530, Anand Balagopalakrishnan wrote:
> Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
> ---
>  meta-arago-distro/conf/distro/include/arago-prefs.inc | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> index a96569f..45482d4 100644
> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> @@ -14,6 +14,11 @@ PREFERRED_PROVIDER_libgbm-dev = "libgbm-dev"
>  
>  PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
>  
> +# J7 has a Rogue GPU core
> +PREFERRED_PROVIDER_virtual/egl_j7-evm = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles1_j7-evm = "ti-img-rogue-umlibs"
> +PREFERRED_PROVIDER_virtual/libgles2_j7-evm = "ti-img-rogue-umlibs"

Would be nice to move these few lines higher - right after the other egl/gles 
preferences for SGX.


>  # This is required when using keystone devices with graphical support
>  # such as Qt5
>  PREFERRED_PROVIDER_virtual/egl_keystone = "mesa"
> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

