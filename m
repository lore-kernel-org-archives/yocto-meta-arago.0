Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTP id 37FAB52987
	for <meta-arago@arago-project.org>;
	Mon, 10 Dec 2012 20:46:03 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MEU006X11NZWC20@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 10 Dec 2012 14:45:46 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7FD6A2016E; Mon,
	10 Dec 2012 15:45:35 -0500 (EST)
Date: Mon, 10 Dec 2012 15:45:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-id: <20121210204535.GB4591@denix.org>
References: <50C648A7.4050601@ti.com>
MIME-version: 1.0
In-reply-to: <50C648A7.4050601@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-arago master 469a8425 seems broken
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
X-List-Received-Date: Mon, 10 Dec 2012 20:46:03 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 10, 2012 at 03:40:07PM -0500, Carlos Hernandez wrote:
> jenkins@jenkins1:/home/a0850405/oe/build$ MACHINE=am335x-evm bitbake
> virtual/bootloader -c clean
> Parsing recipes: 100%
> |####################################################################################|
> Time: 00:00:15
> Parsing of 1353 .bb files complete (0 cached, 1353 parsed). 1719
> targets, 131 skipped, 8 masked, 0 errors.
> ERROR: No recipes available for:
>  
> /home/a0850405/oe/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.0i.bbappend

Carlos,

meta-arago master currently still only works with denzil. So, openssl-1.0.0i 
is present in denzil of oe-core, while master of oe-core has newer 
openssl-1.0.0j.

-- 
Denys


> ERROR: Command execution failed: Exited with 1
> 
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> 
> 
> jenkins@jenkins1:/home/a0850405/oe/sources/meta-arago$ git log
> commit 469a8425e702969a5be18dae0184980bd4d031b4
> Author: Denys Dmytriyenko <denys@ti.com>
> Date:   Thu Dec 6 10:44:26 2012 -0500
> 
>     arago.conf: bump the version
>     
>     Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> 
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

