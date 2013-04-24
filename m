Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 0317C5298C
	for <meta-arago@arago-project.org>;
	Wed, 24 Apr 2013 19:21:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r3OJLEd2031787
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:21:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r3OJLE8D031904
	for <meta-arago@arago-project.org>; Wed, 24 Apr 2013 14:21:14 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 24 Apr 2013 14:21:13 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r3OJLD6m015989;
	Wed, 24 Apr 2013 14:21:13 -0500
Date: Wed, 24 Apr 2013 15:21:13 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20130424192113.GP12173@edge>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] matrix-lighttpd-config: add static cgi and	.out support in Matrix PHP
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
X-List-Received-Date: Wed, 24 Apr 2013 19:21:15 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

I would understand .cgi, but what is it with .o? Are those object files? What 
do you want to do with them?

And I guess a better description of the change in the patch wouldn't hurt 
either.

-- 
Denys


On Wed, Apr 24, 2013 at 07:16:34PM +0000, Cooper Jr., Franklin wrote:
> cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi", ".cgi" => "/bin/sh",  ".o" => "" )
> 
> Can you give an example of the .cgi and .o file that requires this change?
> 
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Zhang, Hao
> > Sent: Wednesday, April 24, 2013 1:29 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] matrix-lighttpd-config: add static cgi and .out
> > support in Matrix PHP
> > 
> > From: Hao Zhang <hzhang@ti.com>
> > 
> > ---
> >  .../matrix-lighttpd-config/lighttpd.conf.matrix    |    4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > config/lighttpd.conf.matrix b/meta-arago-extras/recipes-
> > core/matrix/matrix-lighttpd-config/lighttpd.conf.matrix
> > index 82a9fb8..2dce736 100755
> > --- a/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-
> > config/lighttpd.conf.matrix
> > +++ b/meta-arago-extras/recipes-core/matrix/matrix-lighttpd-config/light
> > +++ tpd.conf.matrix
> > @@ -137,7 +137,7 @@ $HTTP["url"] =~ "\.pdf$" {  # which extensions should
> > not be handle via static-file transfer  #  # .php, .pl, .fcgi are most often
> > handled by mod_fastcgi or mod_cgi -static-file.exclude-extensions = ( ".php",
> > ".pl", ".fcgi" )
> > +static-file.exclude-extensions = ( ".php", ".pl", ".fcgi", ".cgi", ".o"
> > +)
> > 
> >  ######### Options that are good to be but not neccesary to be changed
> > #######
> > 
> > @@ -225,7 +225,7 @@ compress.filetype          = ("text/plain",
> > "text/html","text/javascript","text/
> >  #                            )
> > 
> >  #### CGI module
> > -cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi")
> > +cgi.assign                 = ( ".php"  => "/usr/bin/php-cgi", ".cgi" =>	"/bin/sh",
> > ".o" => "" )
> >  #cgi.assign                 = ( ".pl"  => "/usr/bin/perl",
> >  #                               ".cgi" => "/usr/bin/perl" )
> >  #
> > --
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

