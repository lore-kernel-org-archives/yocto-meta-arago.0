Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id 3BDDB52079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 04:15:29 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYY0046KEHBG9G0@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 05 Feb 2012 22:15:16 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 43E0C203C6; Sun,
	05 Feb 2012 23:15:10 -0500 (EST)
Date: Sun, 05 Feb 2012 23:15:10 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120206041510.GA11841@denix.org>
References: <1328040714-29036-1-git-send-email-Chase.Maupin@ti.com>
	<1328040714-29036-3-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1328040714-29036-3-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 2/4] refresh-screen: add package from old arago overlay
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
X-List-Received-Date: Mon, 06 Feb 2012 04:15:29 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 31, 2012 at 02:11:52PM -0600, Chase Maupin wrote:
> * This package adds a utility to force a screen refresh after
>   graphics applications are executed.  This is to prevent left
>   over graphics artifacts from being displayed in matrix.
> * Ported from old arago overlay
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../recipes-core/matrix/refresh-screen_2.0.bb      |   25 ++++++++++++++++++++
>  1 files changed, 25 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> 
> diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> new file mode 100644
> index 0000000..3a3ad5e
> --- /dev/null
> +++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "Simple Application to force a screen refresh"
> +HOMEPAGE = "https://gitorious.org/matrix-gui-v2/refresh-screen"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://main.cpp;beginline=9;endline=37;md5=884b90f5bf0d711fe32c4f04b5276496"
> +SECTION = "multimedia"
> +PRIORITY = "optional"

There is no PRIORITY field any more, please remove.

-- 
Denys

> +# Make sure that QT font libraries have been installed
> +RDEPENDS += "qt4-embedded-fonts"
> +
> +PR = "r0"
> +
> +SRCREV = "ba27273f0d61dd71589db380f785f091b7ad3efe"
> +BRANCH ?= "master"
> +
> +SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit qt4e
> +
> +do_install() {
> +    install -d ${D}/${bindir}
> +    install -m 0755 ${S}/refresh_screen ${D}/${bindir}
> +}
> -- 
> 1.7.0.4

