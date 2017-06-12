Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id D815A52A5A
	for <meta-arago@arago-project.org>;
	Mon, 12 Jun 2017 22:19:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5CMJHC7016387
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 17:19:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1497305957;
	bh=U6wcL8iFe8+Tn4Ls1hf8yGwcbg5TVyz7hPQX92r9+co=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Ygu3+CYQMMaVCIZUVxnqjT6p+8/eiNnfC7uXEGKs1z6ss9TxJydWT82FiAFPA+aT9
	BNMEyTdNMWeKLz7/USOPD88D5lnwnwU9Vfwq5pbTwbeIuWYsfnLahg4LNzEGOi3te4
	a1Muap0FgZamuh2swnFbcoGuLyug451J7fDZHjXM=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CMJH8D013331
	for <meta-arago@arago-project.org>; Mon, 12 Jun 2017 17:19:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 12 Jun 2017 17:19:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5CMJHsh002209;
	Mon, 12 Jun 2017 17:19:17 -0500
Date: Mon, 12 Jun 2017 18:19:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Eric Ruei <e-ruei1@ti.com>
Message-ID: <20170612221915.GI21219@edge>
References: <1496948064-3161-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
In-Reply-To: <1496948064-3161-1-git-send-email-e-ruei1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH v3 1/3] qtwebbrowser: add QT web browser
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
X-List-Received-Date: Mon, 12 Jun 2017 22:19:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks, Eric, looks good. Please see below for a small comment.

On Thu, Jun 08, 2017 at 02:54:22PM -0400, Eric Ruei wrote:
> - This is a touch-friendly web broswer based on qtwebengine and QML
> 
> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
> ---
>  .../recipes-qt/examples/qtwebbrowser_1.0.bb        | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
> 
> diff --git a/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
> new file mode 100644
> index 0000000..c484bd9
> --- /dev/null
> +++ b/meta-arago-extras/recipes-qt/examples/qtwebbrowser_1.0.bb
> @@ -0,0 +1,34 @@
> +SUMMARY = "Qt Touch-Friendly WebBroswer"
> +HOMEPAGE = "http://blog.qt.io/blog/2016/07/18/qt-webbrowser-1-0/"
> +SECTION = "multimedia"
> +LICENSE = "GPL-3.0 & GFDL-1.3"
> +LIC_FILES_CHKSUM = " \
> +    file://LICENSE.GPLv3;md5=a40e2bb02b1ac431f461afd03ff9d1d6 \
> +    file://LICENSE.FDL;md5=6d9f2a9af4c8b8c3c769f6cc1b6aaf7e \
> +"
> +DEPENDS += "qtwebengine"
> +
> +PR = "r0"
> +
> +BRANCH = "dev"
> +SRCREV = "023733af5523a5ad84359926224fa106001215f4"
> +
> +SRC_URI = "git://code.qt.io/qt-apps/qtwebbrowser.git;protocol=git;branch=${BRANCH} \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit qt-provider
> +
> +# Install qtwebbrowser under /usr/bin
> +do_install() {
> +    install -d ${D}${bindir}
> +    install -d ${D}${datadir}/qt5/examples/webengine/webbrowser/src
> +    install -m 0755 src/qtwebbrowser ${D}${bindir}/qtwebbrowser
> +    cp -R --no-dereference --preserve=mode,links ${S}/* ${D}${datadir}/qt5/examples/webengine/webbrowser/.
> +}
> +
> +FILES_${PN} +=  " \
> +${bindir}/qtwebbrowser \
> +${datadir}/qt5/examples/webengine/webbrowser/* \
> +"

Can you please split the resulting package into ${PN} with only the binary and 
${PN}-examples with the sources? All you need to change is the FILES_ 
statements above. You can pull both into the packagegroup in patch #2. Thanks.


> -- 
> 1.9.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

