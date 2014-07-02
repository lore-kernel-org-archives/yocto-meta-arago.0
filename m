Return-Path: <meta-arago@emagii.com>
Received: from smtp-out11.han.skanova.net (smtp-out11.han.skanova.net
	[195.67.226.200])
	by arago-project.org (Postfix) with ESMTP id BEC745298B
	for <meta-arago@arago-project.org>;
	Wed,  2 Jul 2014 18:05:11 +0000 (UTC)
Received: from [10.175.196.23] (213.66.90.56) by smtp-out11.han.skanova.net
	(8.5.133) (authenticated as u82406562)
	id 5383405400E84470 for meta-arago@arago-project.org;
	Wed, 2 Jul 2014 20:05:10 +0200
Message-ID: <53B449D5.30600@emagii.com>
Date: Wed, 02 Jul 2014 20:05:09 +0200
From: Ulf Samuelsson <meta-arago@emagii.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: meta-arago@arago-project.org
References: <53B44965.5050502@emagii.com>
In-Reply-To: <53B44965.5050502@emagii.com>
X-Forwarded-Message-Id: <53B44965.5050502@emagii.com>
Subject: Re: [meta-ti] Build of qtbase fails due to no OpenGL libraries, but completes after cleaning qtbase.
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
X-List-Received-Date: Wed, 02 Jul 2014 18:05:12 -0000
Content-Type: multipart/alternative;
	boundary="------------090703050307030608010808"

--------------090703050307030608010808
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


-------- Ursprungligt meddelande -------
Ämne: 	Re: [meta-ti] Build of qtbase fails due to no OpenGL libraries, 
but completes after cleaning qtbase.
Datum: 	Wed, 2 Jul 2014 09:32:27 -0400
Från: 	Denys Dmytriyenko <denys@ti.com>
Till: 	Ulf Samuelsson <meta-ti@emagii.com>
Kopia: 	<meta-ti@yoctoproject.org>



On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
> When I build an image with QT5 using meta-arago, qtbase fails with a
> lot of error messages.

> This is the wrong mailing list - meta-ti has nothing to do with qtbase.

> Moreover, why are you still using 5.1.1? There were many fixes in Qt5 5.2.x
> and 5.3.x. Also, it depends on your setup and what layers and features you
> configure. Either way, it's a discussion for a distro layer, you can use
> meta-arago mailing list for that...


I looked through meta-arago and meta-qt5 about a month ago for compatability.

I checked again today:

meta-qt5/master	= 5.3.0
meta-qt5/daisy	= 5.2.1
meta-qt5/dora	= 5.1.1

meta-arago/master = 5.2.0
meta-arago/dora   = 5.2.0 (used to be 5.1.1)
There is no meta-arago/daisy branch.

The only revision I could find which was available in both was 5.1.1.
and that is why I used it.

It would make sense if the qt5 related recipes in meta-arago matched those in meta-qt5.

Now meta-arago is using 5.2.0 which is not present in any branch of meta-qt5 (did not check old branches, only dora and daisy).

I dont understand why the meta-arago:dora recipes for qt5 has been updated from 5.1.1 to 5.2.0,
thus making it incompatible with meta-qt5:dora. Isn't this a mistake.



> Some errors:
>
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:52:1:
> error: expected class-name before '{' token
> linking part1
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
> In destructor 'virtual OpenGLWindow::~OpenGLWindow()':
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> warning: possible problem detected in invocation of delete operator:
> [enabled by default]
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> warning: invalid use of incomplete type 'class QOpenGLPaintDevice'
> [enabled by default]
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> warning: forward declaration of 'class QOpenGLPaintDevice' [enabled
> by default]
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
> note: neither the destructor nor the class-specific operator delete
> will be called, even if they are declared when the class is defined
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
> In member function 'virtual void OpenGLWindow::render()':
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:78:24:
> error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> error: forward declaration of 'class QOpenGLPaintDevice'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:13:
> error: 'GL_COLOR_BUFFER_BIT' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:35:
> error: 'GL_DEPTH_BUFFER_BIT' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:57:
> error: 'GL_STENCIL_BUFFER_BIT' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:78:
> error: 'glClear' was not declared in this scope
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:82:13:
> error: invalid use of incomplete type 'class QOpenGLPaintDevice'
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
> error: forward declaration of 'class QOpenGLPaintDevice'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
> error: no matching function for call to
> 'QPainter::QPainter(QOpenGLPaintDevice*&)'
> $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
> note: candidates are:
> In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/qpainter.h:1:0,
>                  from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/QPainter:1,
>                  from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:47:
>
> Googling indicates that this is because:
>
>    "If -no-opengl is specified and OpenGL development files are
> installed, the error does occur."
>
> If I clean out qtbase, and then continue build, it will complete.
> $ bitbase -c cleansstate qtbase
> $ bitbake <image>
>
> My guess is that during configuration, OpenGL cannot be found, but
> it is there during compile.
> There seems to be a dependency error (libgles-omap3?).
>
>
>
>
> BR
> Ulf Samuelsson
> --
> _______________________________________________
> meta-ti mailing list
>meta-ti@yoctoproject.org
>https://lists.yoctoproject.org/listinfo/meta-ti






--------------090703050307030608010808
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    <div class="moz-forward-container">
      <meta http-equiv="content-type" content="text/html;
        charset=ISO-8859-1">
      -------- Ursprungligt meddelande -------
      <div class="moz-forward-container">
        <table class="moz-email-headers-table" border="0"
          cellpadding="0" cellspacing="0">
          <tbody>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">&Auml;mne:
              </th>
              <td>Re: [meta-ti] Build of qtbase fails due to no OpenGL
                libraries, but completes after cleaning qtbase.</td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Datum:
              </th>
              <td>Wed, 2 Jul 2014 09:32:27 -0400</td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Fr&aring;n:
              </th>
              <td>Denys Dmytriyenko <a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:denys@ti.com">&lt;denys@ti.com&gt;</a></td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Till:
              </th>
              <td>Ulf Samuelsson <a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:meta-ti@emagii.com">&lt;meta-ti@emagii.com&gt;</a></td>
            </tr>
            <tr>
              <th align="RIGHT" nowrap="nowrap" valign="BASELINE">Kopia:
              </th>
              <td><a moz-do-not-send="true"
                  class="moz-txt-link-rfc2396E"
                  href="mailto:meta-ti@yoctoproject.org">&lt;meta-ti@yoctoproject.org&gt;</a></td>
            </tr>
          </tbody>
        </table>
        <br>
        <br>
        <pre>On Wed, Jul 02, 2014 at 07:21:24AM +0200, Ulf Samuelsson wrote:
&gt; When I build an image with QT5 using meta-arago, qtbase fails with a
&gt; lot of error messages.

&gt; This is the wrong mailing list - meta-ti has nothing to do with qtbase.

&gt; Moreover, why are you still using 5.1.1? There were many fixes in Qt5 5.2.x 
&gt; and 5.3.x. Also, it depends on your setup and what layers and features you 
&gt; configure. Either way, it's a discussion for a distro layer, you can use 
&gt; meta-arago mailing list for that...


I looked through meta-arago and meta-qt5 about a month ago for compatability.

I checked again today:

meta-qt5/master	= 5.3.0
meta-qt5/daisy	= 5.2.1
meta-qt5/dora	= 5.1.1

meta-arago/master = 5.2.0
meta-arago/dora   = 5.2.0 (used to be 5.1.1)
There is no meta-arago/daisy branch.

The only revision I could find which was available in both was 5.1.1.
and that is why I used it.

It would make sense if the qt5 related recipes in meta-arago matched those in meta-qt5.

Now meta-arago is using 5.2.0 which is not present in any branch of meta-qt5 (did not check old branches, only dora and daisy).

I dont understand why the meta-arago:dora recipes for qt5 has been updated from 5.1.1 to 5.2.0, 
thus making it incompatible with meta-qt5:dora. Isn't this a mistake.



&gt; Some errors:
&gt; 
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:52:1:
&gt; error: expected class-name before '{' token
&gt; linking part1
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
&gt; In destructor 'virtual OpenGLWindow::~OpenGLWindow()':
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
&gt; warning: possible problem detected in invocation of delete operator:
&gt; [enabled by default]
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
&gt; warning: invalid use of incomplete type 'class QOpenGLPaintDevice'
&gt; [enabled by default]
&gt; In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
&gt; warning: forward declaration of 'class QOpenGLPaintDevice' [enabled
&gt; by default]
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:63:12:
&gt; note: neither the destructor nor the class-specific operator delete
&gt; will be called, even if they are declared when the class is defined
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:
&gt; In member function 'virtual void OpenGLWindow::render()':
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:78:24:
&gt; error: invalid use of incomplete type 'class QOpenGLPaintDevice'
&gt; In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
&gt; error: forward declaration of 'class QOpenGLPaintDevice'
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:13:
&gt; error: 'GL_COLOR_BUFFER_BIT' was not declared in this scope
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:35:
&gt; error: 'GL_DEPTH_BUFFER_BIT' was not declared in this scope
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:57:
&gt; error: 'GL_STENCIL_BUFFER_BIT' was not declared in this scope
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:80:78:
&gt; error: 'glClear' was not declared in this scope
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:82:13:
&gt; error: invalid use of incomplete type 'class QOpenGLPaintDevice'
&gt; In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:41:0:
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.h:47:7:
&gt; error: forward declaration of 'class QOpenGLPaintDevice'
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
&gt; error: no matching function for call to
&gt; 'QPainter::QPainter(QOpenGLPaintDevice*&amp;)'
&gt; $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:84:30:
&gt; note: candidates are:
&gt; In file included from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/qpainter.h:1:0,
&gt;                  from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/include/QtGui/QPainter:1,
&gt;                  from $TMP/$WORKDIR/5.1.1-r0-arago1/qtbase-opensource-src-5.1.1/examples/gui/openglwindow/openglwindow.cpp:47:
&gt; 
&gt; Googling indicates that this is because:
&gt; 
&gt;    "If -no-opengl is specified and OpenGL development files are
&gt; installed, the error does occur."
&gt; 
&gt; If I clean out qtbase, and then continue build, it will complete.
&gt; $ bitbase -c cleansstate qtbase
&gt; $ bitbake &lt;image&gt;
&gt; 
&gt; My guess is that during configuration, OpenGL cannot be found, but
&gt; it is there during compile.
&gt; There seems to be a dependency error (libgles-omap3?).
&gt; 
&gt; 
&gt; 
&gt; 
&gt; BR
&gt; Ulf Samuelsson
&gt; -- 
&gt; _______________________________________________
&gt; meta-ti mailing list
&gt; <a moz-do-not-send="true" class="moz-txt-link-abbreviated" href="mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a>
&gt; <a moz-do-not-send="true" class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.yoctoproject.org/listinfo/meta-ti</a>
</pre>
        <br>
      </div>
      <br>
      <br>
    </div>
    <br>
  </body>
</html>

--------------090703050307030608010808--
