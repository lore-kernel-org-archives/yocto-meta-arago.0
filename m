Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id BC2B152079
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2012 05:01:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LYY00K6XGMJ9JC0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Sun, 05 Feb 2012 23:01:32 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A3317203C6; Mon,
	06 Feb 2012 00:01:31 -0500 (EST)
Date: Mon, 06 Feb 2012 00:01:31 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Chase Maupin <Chase.Maupin@ti.com>
Message-id: <20120206050131.GA8770@denix.org>
References: <1328195973-29006-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1328195973-29006-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] initscript-telnetd: port from old arago overlay
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
X-List-Received-Date: Mon, 06 Feb 2012 05:01:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Feb 02, 2012 at 09:19:33AM -0600, Chase Maupin wrote:
> * Ported the initscript for telnetd from the old arago overlay
>   until this can be convered to a systemd script.
> * telnet is still used and supported by our SDKs
> * Modified the S variable to make the LICENSE_FILE_CHKSUM setting
>   easier and used ${S} in the do_install function.
> * Added the MIT license to the init file for checksum support
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> ---
>  .../initscript-telnetd/initscript-telnetd.bb       |   18 +++++++++
>  .../initscript-telnetd/initscript-telnetd/telnetd  |   40 ++++++++++++++++++++
>  2 files changed, 58 insertions(+), 0 deletions(-)
>  create mode 100644 meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
>  create mode 100644 meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> 
> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> new file mode 100644
> index 0000000..e987092
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "Initscripts for telnetd"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://telnetd;beginline=2;endline=18;md5=d134d0d385c53f9201a270fef8448f29"
> +PR ="r0"
> +
> +SRC_URI = "file://telnetd"
> +
> +S = ${WORKDIR}

You forgot double-quotes around ${WORKDIR} - it's important in case there is a 
space in the path. I fixed it while applying.

-- 
Denys


> +INITSCRIPT_NAME = "telnetd"
> +INITSCRIPT_PARAMS = "defaults 10"
> +
> +inherit update-rc.d
> +
> +do_install () {
> +	install -d ${D}${sysconfdir}/init.d/
> +	install -c -m 755 ${S}/telnetd ${D}${sysconfdir}/init.d/telnetd
> +}
> diff --git a/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> new file mode 100644
> index 0000000..116dd6d
> --- /dev/null
> +++ b/meta-arago-distro/recipes-connectivity/initscript-telnetd/initscript-telnetd/telnetd
> @@ -0,0 +1,40 @@
> +#! /bin/sh
> +#Permission is hereby granted, free of charge, to any person obtaining a copy
> +#of this software and associated documentation files (the "Software"), to deal
> +#in the Software without restriction, including without limitation the rights
> +#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> +#copies of the Software, and to permit persons to whom the Software is
> +#furnished to do so, subject to the following conditions:
> +#
> +#The above copyright notice and this permission notice shall be included in
> +#all copies or substantial portions of the Software.
> +#
> +#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> +#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
> +#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
> +#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> +#THE SOFTWARE.
> +
> +telnetd=/usr/sbin/telnetd
> +
> +test -x "$telnetd" || exit 0
> +
> +case "$1" in
> +  start)
> +    echo -n "Starting telnet daemon"
> +    start-stop-daemon --start --quiet --exec $telnetd
> +    echo "."
> +    ;;
> +  stop)
> +    echo -n "Stopping telnet daemon"
> +    start-stop-daemon --stop --quiet --pidfile /var/run/telnetd.pid
> +    echo "."
> +    ;;
> +  *)
> +    echo "Usage: /etc/init.d/telnetd {start|stop}"
> +    exit 1
> +esac
> +
> +exit 0
> -- 
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

