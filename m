Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id BB39952976
	for <meta-arago@arago-project.org>;
	Tue, 30 Jul 2019 18:06:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6UI5SWO117248;
	Tue, 30 Jul 2019 13:05:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564509928;
	bh=PN3g2dGEHS6vwF2yl/AKmg6gCOk5u+OwPhldr3U+koc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=WeuarUEVoNl9jaN9FVGqEqc4lMcwNzHEa54uHP7a2D+u+t9+BVFrec6nBGPCBHydz
	BZ8CuWZOYPc50WS21415j+eoQtWYzYcWemjfwiEHrDNP+GeNKfXNrkcOcwO0c2MZ8A
	xUFt3hFCfsNj4t7lB1mu7zwlqYt1z+34j8ZkTbDM=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6UI5S2Q004333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Jul 2019 13:05:28 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 30 Jul 2019 13:05:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 30 Jul 2019 13:05:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6UI5RZH103691;
	Tue, 30 Jul 2019 13:05:27 -0500
Date: Tue, 30 Jul 2019 14:05:27 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20190730180527.GE459@beryl>
References: <20190725052703.11313-1-ankur.tyagi85@gmail.com>
	<CADySD0F3WVdq=uu9tWLeBTT=0Vc=WMgYLSETJaFbd0Mh79-wjg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0F3WVdq=uu9tWLeBTT=0Vc=WMgYLSETJaFbd0Mh79-wjg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [oe-layersetup][PATCH] oe-layersetup.sh: Fix printf error if repo uri has space
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
X-List-Received-Date: Tue, 30 Jul 2019 18:06:22 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Merged, thanks!

On Sun, Jul 28, 2019 at 10:21:46PM +1200, Ankur Tyagi wrote:
> ping
> 
> regards
> Ankur
> 
> On Thu, Jul 25, 2019 at 5:27 PM Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> >
> > If repo uri has space, then url will have '%20'
> > and script gives follwoing error
> > bash: printf: 'M': invalid format character
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
> >  oe-layertool-setup.sh | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> > index 5a0175d..d14ed4f 100755
> > --- a/oe-layertool-setup.sh
> > +++ b/oe-layertool-setup.sh
> > @@ -276,12 +276,12 @@ configure_repo() {
> >
> >      # Check if the repo with $name was already seen.  Use the , at the end
> >      # of the grep to avoid matching similar named repos.
> > -    temp=`printf "$output\n" | grep -e "^$name,"`
> > +    temp=`printf '%s\n' $output | grep -e "^$name,"`
> >
> >      if [ "x$temp" != "x" ]
> >      then
> >          echo "This repository ($name) has already been configured with the following values:"
> > -        printf "\t$temp\n"
> > +        printf '\t%s\n' $temp
> >          echo "Skipping configuring duplicate repository"
> >          return 1
> >      fi
> > @@ -928,7 +928,7 @@ then
> >      then
> >          mkdir -p $dir
> >      fi
> > -    printf "$output\n" > $outputfile
> > +    printf '%s\n' $output > $outputfile
> >      echo "Output file is $outputfile"
> >  fi
> >
> > --
> > 2.17.1
> >
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

