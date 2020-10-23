Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1CB28520DE
	for <meta-arago@arago-project.org>;
	Fri, 23 Oct 2020 16:23:37 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NGKVOl089311
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 11:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603470031;
	bh=G34GcVqGR+6X6TCLcxic3vNkhviTjjwa1b0R7kA8AJQ=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=o4poJ7eFItKG0JwU+ABg3LWeDQapH7AgQkv/iC+mhOE0VHsjFDUdZkUunIw9l5g0K
	ut5/wWF9/jMcfsZSEHvoPkle/uQ1mV5o0sKE1CPBDbMdP8fUHkWnRuMdricZqpaYuf
	++FBUr+z9Z8d4VLVhSg4nKtQXbvU9jb1lSIKsIV8=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NGKV3K114060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 23 Oct 2020 11:20:31 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 23 Oct 2020 11:20:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 23 Oct 2020 11:20:31 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09NGKVm9078553;
	Fri, 23 Oct 2020 11:20:31 -0500
To: Gowtham Tammana <g-tammana@ti.com>, <meta-arago@arago-project.org>, Denys
	Dmytriyenko <denys@ti.com>
References: <20201022115052.7711-1-g-tammana@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <2ec10b3b-73fc-3bb2-8c26-fbb512665f24@ti.com>
Date: Fri, 23 Oct 2020 11:20:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022115052.7711-1-g-tammana@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master][PATCH] cairo: enable gles2 support
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
X-List-Received-Date: Fri, 23 Oct 2020 16:23:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Gowtham

On 10/22/20 6:50 AM, Gowtham Tammana wrote:
> add gles2 support for devices which can support it.
>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>   meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
>
> diff --git a/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> new file mode 100644
> index 00000000..3d67bb6a
> --- /dev/null
> +++ b/meta-arago-distro/recipes-graphics/cairo/cairo_%.bbappend
> @@ -0,0 +1,3 @@
> +PR_append = ".arago1"
> +
> +PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl glesv2', '', d)}"

For completeness this patch breaks K2 builds as we discussed off line.

Dan


