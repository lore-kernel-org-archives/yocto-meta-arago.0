Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id D0F2152973
	for <meta-arago@arago-project.org>;
	Tue,  7 Oct 2014 21:11:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0ND300F11EU18LK3@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 07 Oct 2014 16:10:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id E2A1B20261; Tue,
	07 Oct 2014 17:10:48 -0400 (EDT)
Date: Tue, 07 Oct 2014 17:10:48 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Manuel Torres <manuel.torres.fernandez@gmail.com>
Message-id: <20141007211048.GH25997@denix.org>
References: <CAF+2n7Ssaq3OwRiY6kicGdh+N8z0o2OPNJcd8MGbEvTTfioYDA@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAF+2n7Ssaq3OwRiY6kicGdh+N8z0o2OPNJcd8MGbEvTTfioYDA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Video encoding on OMAP 4430
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
X-List-Received-Date: Tue, 07 Oct 2014 21:11:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Sorry for the delay.

Hmm, it appears the toolchain configuration from meta-arago-distro is still 
somewhat required to use meta-arago-extras... I need to look into that and fix 
this part, so meta-arago-extras can be used separately.

-- 
Denys


On Fri, Sep 26, 2014 at 10:35:30AM +0200, Manuel Torres wrote:
> Hello everyone,
> 
> I am trying to encode video using the OMAP 4430 video encoding capabilites
> with a Gumstix Duovero Zephyr board. I have been told that the
> gst-plugins-ducati recipe of the meta-arago-extras layer might work
> although it has also been noted that it is intended for OMAP5.
> 
> This is as far as I got:
> 
> I included the meta-arago-extras layer, ran "bitbake-layers show-recipes"
> and got this error:
> 
> Parsing recipes..ERROR: ExpansionError during parsing
> /home/mtorres/Development/
> Gumstix/yocto/poky/meta-arago-extras/meta-arago-extras/recipes-core/meta/
> external-arago-toolchain.bb: Failure expanding variable ARG_VER_MAIN[:=],
> expression was ${@arg_get_main_version(d)} which triggered exception
> TypeError: unsupported operand type(s) for +: 'NoneType' and 'str'
> Traceback (most recent call last):
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> line 726, in <module>
>     sys.exit(main(sys.argv[1:]) or 0)
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> line 50, in main
>     cmds.onecmd(' '.join(args))
>   File "/usr/lib/python2.7/cmd.py", line 221, in onecmd
>     return func(arg)
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> line 212, in do_show_recipes
>     self.init_bbhandler()
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/bin/bitbake-layers",
> line 67, in init_bbhandler
>     self.bbhandler.prepare(config_only)
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
> line 82, in prepare
>     self.parseRecipes()
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/tinfoil.py",
> line 65, in parseRecipes
>     self.cooker.updateCache()
>   File
> "/home/mtorres/Development/Gumstix/yocto/poky/bitbake/lib/bb/cooker.py",
> line 1309, in updateCache
>     raise bb.BBHandledException()
> bb.BBHandledException
> 
> Any help will be greatly appreciated.

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


