Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7D0E3529F7
	for <meta-arago@arago-project.org>;
	Fri,  7 Feb 2020 19:28:33 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 017JQc2h032953
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 13:26:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581103598;
	bh=V116TkdgUbhgtBRJ1mh7lOXjt8VNpgEn/rSoGg4eC70=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=jq5hESpDzRPtaLmWybatZnBWDaZbs2kKyt5fXZInK3kWQlRqJ/B+RDtuWe9Qr+j1o
	lOQ2Vp7KyLrg6ki5y38zqgI8/3tIpKm5nM3yWAHRUwDI4D3L+3hlAzOb6qkyde9w0B
	hvsh/B7319zhmOfVNn56LZR5aVGYan7endOL3umw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017JQcsT128535
	for <meta-arago@arago-project.org>; Fri, 7 Feb 2020 13:26:38 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 7 Feb 2020 13:26:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 7 Feb 2020 13:26:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 017JQcwf056395;
	Fri, 7 Feb 2020 13:26:38 -0600
Date: Fri, 7 Feb 2020 14:26:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200207192638.GD25484@beryl>
References: <1581101188-9014-1-git-send-email-j-stiffler@ti.com>
	<1581101188-9014-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1581101188-9014-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [RFC][PATCH 2/2] meta-toolchain-arago-minimal: define minimal devkit/sdk
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
X-List-Received-Date: Fri, 07 Feb 2020 19:28:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Feb 07, 2020 at 01:46:28PM -0500, Jacob Stiffler wrote:
> * This minimal sdk can use package management to obtain needed dev
>   packages.
> * Resulting shar image is ~45 MB
> * Usage could be a little more elgant, but if feeds are available,
>   the following can be done to install any package availble on a feed:
> 
>   $ cat ./sysroots/<target_sysroot>/etc/opkg/* > ./opkg.conf
> 
>   $ ./sysroots/<host_sysroot>/usr/bin/opkg --volatile-cache -f ./opkg.conf \
>         -t $(mktemp -d) -o ./sysroot/<target_sysroot> update
> 
>   $ # To restore current tisdk sysroot (plus unuseable binaries)
>   $ ./sysroots/<host_sysroot>/usr/bin/opkg --volatile-cache -f ./opkg.conf \
>         -t $(mktemp -d) -o ./sysroot/<target_sysroot> install \
>         packagegroup-arago-toolchain-tisdk-target

meta-toolchain-arago already handles all the above, including feeds and 
package-management. It may not be very minimal, sure, but at least it contains 
the minimal toolchain to be useful. I'd rather look into shrinking existing 
meta-toolchain-arago, especially since there's a larger version called 
meta-toolchain-arago-tisdk...

Denys


> * This also has the potential to create new rootfs from feeds. Initial
>   testing showed problems with setting ownership of files to root. The
>   host sysroot does provide pseudo, so it seems possible without using
>   root on the host.
> 
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb
> 
> diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb
> new file mode 100644
> index 0000000..8b7e8bc
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-minimal.bb
> @@ -0,0 +1,5 @@
> +require recipes-core/meta/meta-toolchain-arago-tisdk.bb
> +
> +TOOLCHAIN_SUFFIX = "-minimal"
> +TOOLCHAIN_TARGET_TASK = "packagegroup-arago-toolchain-minimal-target"
> +TOOLCHAIN_HOST_TASK = "nativesdk-packagegroup-arago-sdk-host nativesdk-buildtools-perl-dummy"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

