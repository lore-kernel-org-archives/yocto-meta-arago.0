Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E7E095299D
	for <meta-arago@arago-project.org>;
	Mon,  4 Nov 2013 03:52:28 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA43qSPJ022647
	for <meta-arago@arago-project.org>; Sun, 3 Nov 2013 21:52:28 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA43qSQ0032747
	for <meta-arago@arago-project.org>; Sun, 3 Nov 2013 21:52:28 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Sun, 3 Nov 2013 21:52:27 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA43qRIv031707;
	Sun, 3 Nov 2013 21:52:27 -0600
Date: Sun, 3 Nov 2013 22:52:27 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20131104035226.GQ24696@edge>
References: <4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054985DA9@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Ring,
	Chris" <cring@ti.com>
Subject: Re: help needed: Need pass variable to autotools .configure
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
X-List-Received-Date: Mon, 04 Nov 2013 03:52:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 04, 2013 at 03:06:28AM +0000, Nelson, Sam wrote:
> Currently , my recipe inherits autotools.

> I would like update recipe to pass an environment variable define like the 
> following when executing ./configure command.

> VAR_NAME=<dir_name>
> 
> Appreciate help on how this can be achieved in the recipe.

Sam,

To pass something to a ./configure script, you need EXTRA_OECONF:

EXTRA_OECONF += "VAR_NAME=<dir_name>"

Similarly, to pass something to a Makefile, you need EXTRA_OEMAKE:

EXTRA_OEMAKE += "VAR_NAME=<dir_name>"

-- 
Denys

