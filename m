Return-Path: <meta-arago@emagii.com>
Received: from smtp-out21.han.skanova.net (smtp-out21.han.skanova.net
	[195.67.226.208])
	by arago-project.org (Postfix) with ESMTP id 7D8D052A42
	for <meta-arago@arago-project.org>;
	Thu,  3 Jul 2014 17:13:33 +0000 (UTC)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out21.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 53804BED00FB0CEC for meta-arago@arago-project.org;
	Thu, 3 Jul 2014 19:13:32 +0200
Message-ID: <53B58F3C.2070207@emagii.com>
Date: Thu, 03 Jul 2014 19:13:32 +0200
From: Ulf Samuelsson <meta-arago@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <53B44965.5050502@emagii.com>	<53B449D5.30600@emagii.com>	<20140702181315.GA15788@edge>	<53B459CC.20805@emagii.com>	<20140702191802.GB15788@edge>	<53B45C0A.60805@emagii.com>	<8F29D6B095ED194EA1980491A5E029710C6DA912@DFLE08.ent.ti.com>	<53B46ADA.1070400@emagii.com>	<8F29D6B095ED194EA1980491A5E029710C6DAA36@DFLE08.ent.ti.com>
	<53B4F6EC.6070606@emagii.com>
In-Reply-To: <53B4F6EC.6070606@emagii.com>
Subject: Re: Color output
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
X-List-Received-Date: Thu, 03 Jul 2014 17:13:33 -0000
Content-Type: multipart/alternative;
	boundary="------------060101060809000003090501"

--------------060101060809000003090501
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

2014-07-03 08:23, Ulf Samuelsson skrev:
> >> One issue which I need to investigate, is the colours.
> >> At boot, the Penguin appears with Blue feet, and not Yellow/Orange 
> and the
> >> customer splash screen and applications also have the wrong colour.
>
> > [Franklin] I believe that color issue has to-do with the am335x errata
> >    (http://www.ti.com/lit/er/sprz360f/sprz360f.pdf (page 8). )
> > The BBB is hooked up to display correctly in 16bpp mode but if you 
> use 24bpp then your colors will look messed up.
> > I recommend posting this question to e2e.ti.com and the right people 
> can help you with this.
>
> Did a posting there, yet to get a reply, so I am posting here as well.

I have found a workaround.

Before I run S00psplash,

I will do 'fbset -depth 16'

Then psplash looks OK, and omaplfb loads, and the applications look right.

Now I only need to figure out how to do 16 bpp in the Device Tree file 
for the da8xx-fb driver.

For the tilcdc there is the tilcdc-panel.c file.
Is there something similar for the da8xx-fb driver?

BR
Ulf Samuelsson

--------------060101060809000003090501
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">2014-07-03 08:23, Ulf Samuelsson skrev:<br>
    </div>
    <blockquote cite="mid:53B4F6EC.6070606@emagii.com" type="cite">
      <meta content="text/html; charset=ISO-8859-1"
        http-equiv="Content-Type">
      &gt;&gt; One issue which I need to investigate, is the colours. <big><br>
      </big>&gt;&gt; At boot, the Penguin appears with Blue feet, and
      not Yellow/Orange and the <big><br>
      </big>&gt;&gt; customer splash screen and applications also have
      the wrong colour. <big><br>
        <br>
      </big>&gt; [Franklin] I believe that color issue has to-do with
      the am335x errata <br>
      &gt;&nbsp;&nbsp;&nbsp; (<a moz-do-not-send="true" class="moz-txt-link-freetext"
        href="http://www.ti.com/lit/er/sprz360f/sprz360f.pdf">http://www.ti.com/lit/er/sprz360f/sprz360f.pdf</a>
      (page 8). <big>)<br>
      </big>&gt; The BBB is hooked up to display correctly in 16bpp mode
      but if you use 24bpp then your colors will look messed up. <br>
      &gt; I recommend posting this question to e2e.ti.com and the right
      people can help you with this. <br>
      <br>
      Did a posting there, yet to get a reply, so I am posting here as
      well.<br>
    </blockquote>
    <br>
    I have found a workaround.<br>
    <br>
    Before I run S00psplash, <br>
    <br>
    I will do 'fbset -depth 16'<br>
    <br>
    Then psplash looks OK, and omaplfb loads, and the applications look
    right.<br>
    <br>
    Now I only need to figure out how to do 16 bpp in the Device Tree
    file for the da8xx-fb driver.<br>
    <br>
    For the tilcdc there is the tilcdc-panel.c file.<br>
    Is there something similar for the da8xx-fb driver?<br>
    <br>
    BR<br>
    Ulf Samuelsson<br>
  </body>
</html>

--------------060101060809000003090501--
