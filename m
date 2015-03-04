Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id B3D9452A29
	for <meta-arago@arago-project.org>;
	Wed,  4 Mar 2015 14:46:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t24Eke6N006007
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 08:46:40 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24Ekc6Y023204
	for <meta-arago@arago-project.org>; Wed, 4 Mar 2015 08:46:39 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 08:46:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t24EkcRW012652;
	Wed, 4 Mar 2015 08:46:38 -0600
Date: Wed, 4 Mar 2015 09:46:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20150304144637.GD6052@edge>
References: <20150227223435.GM6052@edge>
	<1425312208-9221-1-git-send-email-ceh@ti.com>
	<20150304003748.GA6052@edge> <54F718CD.3050503@ti.com>
MIME-Version: 1.0
In-Reply-To: <54F718CD.3050503@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3 v2] meta-arago-distro/recipes-devtools: serialcheck recipe
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
X-List-Received-Date: Wed, 04 Mar 2015 14:46:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Mar 04, 2015 at 09:38:05AM -0500, Carlos Hernandez wrote:
> On 03/03/2015 07:37 PM, Denys Dmytriyenko wrote:
> >On Mon, Mar 02, 2015 at 11:03:28AM -0500, Carlos Hernandez wrote:
> >>>Serialcheck is a simple utility to verify serial ports functionality.
> >>>It supports all "standard" bauds listed in
> >>>include/uapi/asm-generic/termbits.h
> >Looks good, thanks. Just a small clarification - I see you install it in /bin
> >instead of more standard /usr/bin. Is there any special reason for that?
> >
> >
> 
> No, it could be placed is /usr/bin. Could you change it when you
> apply the patch or do I have to submit another version?

Sure, I can change it.

