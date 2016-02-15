Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id F144752982
	for <meta-arago@arago-project.org>;
	Mon, 15 Feb 2016 18:53:30 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1FIrUwd008063
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:53:30 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FIrUvM020312
	for <meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:53:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 15 Feb 2016 12:53:29 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1FIrTPq018115	for
	<meta-arago@arago-project.org>; Mon, 15 Feb 2016 12:53:29 -0600
Message-ID: <56C21EA9.3090209@ti.com>
Date: Mon, 15 Feb 2016 13:53:29 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1455561794-2206-1-git-send-email-j-stiffler@ti.com>
Subject: Re: [PATCH 1/2] arago.conf: Remove qtwayland from opencv PACKAGECONFIG for keystone
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
X-List-Received-Date: Mon, 15 Feb 2016 18:53:31 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

This may be more of an RFC as I have some concerns.

I am concerned with this patch as it adds machine-specific configuration 
for opencv, but the recipe is not marked as machine-specific.

Will this pose an issue?

Now I understand that if opencv packaging is done well enough, that we 
should still be able to build the qtwayland parts of opencv, but do not 
install them in the keystone filesystem so that wayland is not brought 
in. However, wayland has a dependency on the ddk, which is not 
compatible with keystone machines. Thus the opencv build will be broken 
for keystone machines.

Any suggestions?



On 2/15/2016 1:43 PM, Jacob Stiffler wrote:
> * keystone machines do not have a display, hence they do not support
>    wayland
> * opencv adds qtwayland support since wayland is in DISTRO_FEATURES
> * Remove qtwayland from opencv PACKAGECONFIG for keystone machines
>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 325e112..38c7887 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -58,6 +58,9 @@ PACKAGECONFIG_append_pn-qtmultimedia  = " gstreamer"
>   # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
>   PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
>   
> +# Remove qtwayland from openvcv PACKAGECONFIG for keystone
> +PACKAGECONFIG_remove_pn-opencv_keystone = "qtwayland"
> +
>   # Enable UI and scripting for perf
>   PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
>   


