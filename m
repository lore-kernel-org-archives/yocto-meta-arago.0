Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by arago-project.org (Postfix) with ESMTP id BA41652A1B
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 18:01:58 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MIU0053EA2226F1@vms173003.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 26 Feb 2013 12:01:31 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3F785200BD; Tue,
	26 Feb 2013 13:01:13 -0500 (EST)
Date: Tue, 26 Feb 2013 13:01:13 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-id: <20130226180113.GI6725@denix.org>
References: <3C08AEEB3C731745938BC83D029FE5E3921452@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <3C08AEEB3C731745938BC83D029FE5E3921452@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: question about packagegroup-arago-standalone-sdk-target recipe
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
X-List-Received-Date: Tue, 26 Feb 2013 18:01:59 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Feb 26, 2013 at 04:59:34PM +0000, Zhou, Jingting wrote:
> Hey all, I am trying to bitbake meta-toolchain-arago, I already removed
> 
>    ${LIBC_DEPENDENCIES} \
> linux-libc-headers-dev \
> 
> in packagegroup-arago-standalone-sdk-target recipe, but I still have the error
> 
> | Collected errors:
> |  * satisfy_dependencies_for: Cannot satisfy the following dependencies for packagegroup-arago-standalone-sdk-target:
> |  *    libc6 (= 2012.03-r2) *
> |  * opkg_install_cmd: Cannot install package packagegroup-arago-standalone-sdk-target.
> | package libtinfo5 suggests installing ncurses-terminfo
> | ncurses-dev: unsatisfied recommendation for ncurses-libmenu-dev
> 
> I tried "grep -r libc6 *", but still couldn't find where this libc6 package 
> comes from. Why do we need this?
> 
> When I tried removing the -dev suffix of the packages(like I used i2c-tools 
> instead of i2c-tools-dev, I know they are different packages), the build 
> went fine. Is this libc6 related to the -dev packages? I am really confused 
> here. Attached are the logs. Thanks~

Jingting,

libc6 is the main C library, we definitely need it and you cannot remove it:
http://www.kernel.org/doc/man-pages/online/pages/man7/libc.7.html
http://en.wikipedia.org/wiki/C_standard_library
http://www.gnu.org/software/libc/

As of your problem, there's something else going on and I need to take a close 
look at it - it's not as simple as just remove the libc6, as you say...

BTW, above works with the Arago toolchain just fine, has to do with Linaro 
that you are using.

-- 
Denys

