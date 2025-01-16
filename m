Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F4239C02183
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 20:59:14 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3664.1737061148514374456
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 16 Jan 2025 12:59:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7761640C6B;
	Thu, 16 Jan 2025 20:59:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hsl-5a0q5B6X; Thu, 16 Jan 2025 20:59:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 31AFB40A3D;
	Thu, 16 Jan 2025 20:59:02 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8F1F916415B; Thu, 16 Jan 2025 15:59:01 -0500 (EST)
Date: Thu, 16 Jan 2025 15:59:01 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: d-mittal@ti.com
Cc: meta-arago@lists.yoctoproject.org, Ryan Eatmon <reatmon@ti.com>,
	Karan Saxena <karan@ti.com>, Krunal Bhargav <k-bhargav@ti.com>,
	Chirag Shilwant <c-shilwant@ti.com>
Subject: Re: [meta-arago][master/scarthgap][PATCH] packagegroup-arago-base:
 Add mosquitto packages
Message-ID: <20250116205901.GG21836@denix.org>
References: <20250116135431.1937360-1-d-mittal@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116135431.1937360-1-d-mittal@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 16 Jan 2025 20:59:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15696

On Thu, Jan 16, 2025 at 07:24:31PM +0530, Divyansh Mittal via lists.yoctoproject.org wrote:
> Mosquitto is an open source (Eclipse licensed) message broker that
> implements the MQ Telemetry Transport protocol providing both an MQTT
> broker and several command-line clients.
> 
> Signed-off-by: Divyansh Mittal <d-mittal@ti.com>
> ---
>  .../recipes-core/packagegroups/packagegroup-arago-base.bb    | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 121fa432..7634cb0c 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -50,6 +50,11 @@ ARAGO_EXTRA = "\
>      cifs-utils \
>      phytool \
>      lldpd \
> +    mosquitto \
> +    libmosquitto1 \
> +    libmosquittopp1 \

You don't need to explicitly list the libraries here. I haven't checked the 
mosquitto packaging, but I'm pretty sure either the main package or the 
clients one have the necessary dependencies. You do want to avoid explicitly 
listing libraries in here, especially since they contain the version number 
in their names when Debian renaming is enabled, or have completely different 
names otherwise.


> +    mosquitto-clients \
> +    mosquitto-dev \

Do you really need the development package here. Especially in the "base" 
packagegroup, which is meant to be used for minimal and bootstrapping images.

Just pulling a single -dev package like this will have a snowball effect and 
will explode the dependency tree with hundreds of other development packages, 
making the image suitable for runtime "development".

I just did a quick experiment with tisdk-base-image, just adding mosquitto-dev 
the number of packages increased by 112 and the size grew by 20%. And I also 
see both mosquitto libraries being added automatically. Here's the list:

acl
acl-dev
attr
attr-dev
base-files-dev
base-passwd-dev
bash-completion-dev
bash-dev
bzip2
bzip2-dev
cjson
cjson-dev
cryptodev-linux
cryptodev-linux-dev
dbus-dev
kbd-dev
kmod-dev
libc-malloc-debug0
libc6-dev
libc6-extra-nss
libc6-thread-db
libc6-utils
libcap-dev
libcap-ng-dev
libcrypt-dev
libedit-dev
libexpat-dev
libffi-dev
libform5
libgcc-s-dev
libgdbm-compat4
libgdbm-dev
libgdbm6
libgirepository-1.0-1
libgirepository-1.0-dev
libglib-2.0-dev
libmenu5
libmosquitto1
libmosquittopp1
libnsl-dev
libnsl3
libnss-db2
libpam-dev
libpanel5
libpcre2-16-0
libpcre2-32-0
libpcre2-dev
libseccomp-dev
libsqlite3-dev
libstdc++-dev
libticw5
libtirpc-dev
libuuid-dev
libuv-dev
libuv1
libwebsockets-dev
libwebsockets-evlib-uv
libwebsockets19
libxml2-dev
libz-dev
linux-libc-headers-dev
mosquitto
mosquitto-dev
ncurses-dev
openssl-dev
perl
perl-dev
perl-module-config-heavy
python3-asyncio
python3-compile
python3-crypt
python3-ctypes
python3-datetime
python3-dev
python3-difflib
python3-email
python3-html
python3-io
python3-json
python3-logging
python3-math
python3-mime
python3-netclient
python3-netserver
python3-numbers
python3-packaging
python3-packaging-dev
python3-pickle
python3-pkg-resources
python3-pkgutil
python3-plistlib
python3-pprint
python3-profile
python3-setuptools
python3-setuptools-dev
python3-shell
python3-stringold
python3-threading
python3-unittest
python3-unixadmin
python3-xml
shadow-dev
shadow-securetty-dev
shared-mime-info-dev
systemd-dev
uthash-dev
util-linux-dev
volatile-binds-dev
xz
xz-dev
zstd
zstd-dev

-- 
Denys

